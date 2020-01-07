//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Vitali Tatarintev on 05.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI
import CodeScanner
import UserNotifications

struct ProspectsView: View {
  enum FilterType {
    case none, contacted, uncontacted
  }
  enum SortType {
    case mostRecent, byName
  }

  @EnvironmentObject var prospects: Prospects

  @State private var isShowingScanner = false
  @State private var sortOrder: SortType = .mostRecent

  let filter: FilterType

  var title: String {
    switch filter {
    case .none:
      return "Everyone"
    case .contacted:
      return "Contacted people"
    case .uncontacted:
      return "Uncontacted people"
    }
  }

  var filteredProspects: [Prospect] {
    switch filter {
    case .none:
      return prospects.people
    case .contacted:
      return prospects.people.filter { $0.isContacted }
    case .uncontacted:
      return prospects.people.filter { !$0.isContacted }
    }
  }

  var sortedProspects: [Prospect] {
    switch sortOrder {
    case .mostRecent:
      return filteredProspects.sorted(by: { $0.createdAt < $1.createdAt })
    case .byName:
      return filteredProspects.sorted(by: { $0.name < $1.name })
    }
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(sortedProspects) { prospect in
          HStack {
            if self.filter == .none {
              Image(systemName: prospect.isContacted ? "checkmark.circle" : "questionmark.diamond")
            }

            VStack(alignment: .leading) {
              Text(prospect.name)
                .font(.headline)
              Text(prospect.emailAddress)
                .foregroundColor(.secondary)
            }
          }
          .contextMenu {
            Button(prospect.isContacted ? "Mark Uncontacted" : "Mark Contacted") {
              self.prospects.toggle(prospect)
            }

            if !prospect.isContacted {
              Button("Remind Me") {
                self.addNotification(for: prospect)
              }
            }

            Button(self.sortOrder == .mostRecent ? "Sort by name" : "Sort by recently added") {
              self.sortOrder = self.sortOrder == .mostRecent ? .byName : .mostRecent
              print("Sort order \(self.sortOrder)")
            }
          }
        }
      }
        .navigationBarTitle(title)
        .navigationBarItems(trailing: Button(action: {
          self.isShowingScanner = true
        }) {
          Image(systemName: "qrcode.viewfinder")
          Text("Scan")
        })
        .sheet(isPresented: $isShowingScanner) {
          CodeScannerView(codeTypes: [.qr], simulatedData: self.generateSimulatedData(), completion: self.handleScan)
        }
    }
  }

  func generateSimulatedData() -> String {
    let firstNames = ["John", "Bob", "Alice", "Paul", "Ralf", "Baba"]
    let lastNames = ["Doe", "Voss", "Smith", "Gates", "Ampelmann"]
    let firstName = firstNames[Int.random(in: 0..<firstNames.count)]
    let lastName = lastNames[Int.random(in: 0..<lastNames.count)]
    let email = "\(firstName.lowercased())@\(lastName.lowercased()).com"

    return "\(firstName) \(lastName)\n\(email)"
  }

  func handleScan(result: Result<String, CodeScannerView.ScanError>) {
    self.isShowingScanner = false

    switch result {
    case .success(let code):
      let details = code.components(separatedBy: "\n")
      guard details.count == 2 else { return }

      let person = Prospect()
      person.name = details[0]
      person.emailAddress = details[1]

      self.prospects.add(person)
    case .failure( _): // let error
      print("Scanning failed")
    }
  }

  func addNotification(for prospect: Prospect) {
    let center = UNUserNotificationCenter.current()

    let addRequest = {
      let content = UNMutableNotificationContent()
      content.title = "Contact \(prospect.name)"
      content.subtitle = prospect.emailAddress
      content.sound = UNNotificationSound.default

      var dateComponents = DateComponents()
      dateComponents.hour = 9
      // let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
      let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

      let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
      center.add(request)
    }

    center.getNotificationSettings { settings in
      if settings.authorizationStatus == .authorized {
        addRequest()
      } else {
        center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
          if success {
            addRequest()
          } else {
            print("D'oh")
          }
        }
      }
    }
  }
}

struct ProspectsView_Previews: PreviewProvider {
  static var previews: some View {
    ProspectsView(filter: .none)
  }
}
