//
//  DetailView.swift
//  Bookworm
//
//  Created by Vitali Tatarintev on 13.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import CoreData
import SwiftUI

struct DetailView: View {
  @Environment(\.managedObjectContext) var moc
  @Environment(\.presentationMode) var presentationMode
  @State private var showingDeleteAlert = false

  let book: Book

  var body: some View {
    GeometryReader { geometry in
      VStack {
        ZStack(alignment: .bottomTrailing) {
          Image(self.book.genre!.isEmpty ? "Poetry" : self.book.genre!)
            .frame(maxWidth: geometry.size.width)

          if self.book.genre!.isEmpty == false {
            Text(self.book.genre?.uppercased() ?? "FANTASY")
              .font(.caption)
              .fontWeight(.black)
              .padding(8)
              .foregroundColor(.white)
              .background(Color.black.opacity(0.75))
              .clipShape(Capsule())
              .offset(x: -5, y: -5)
          }
        }

        Text(self.book.author ?? "Unknown author")
          .font(.title)
          .foregroundColor(.secondary)

        if self.book.publishedAt != nil {
          Text("Publish date: \(self.formattedPublishDate(book: self.book))")
        }

        Text(self.book.review ?? "No review")
        .padding()

        RatingView(rating: .constant(Int(self.book.rating)))
          .font(.largeTitle)

        Spacer()
      }
    }
    .navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
    .alert(isPresented: $showingDeleteAlert) {
      Alert(
        title: Text("Delete book"),
        message: Text("Are you sure?"),
        primaryButton: .destructive(Text("Delete")) { self.deleteBook() },
        secondaryButton: .cancel()
      )
    }
    .navigationBarItems(trailing: Button(action: {
      self.showingDeleteAlert = true
    }) {
      Image(systemName: "trash")
    })
  }

  func deleteBook() {
    moc.delete(book)

    // try? self.moc.save()

    presentationMode.wrappedValue.dismiss()
  }

  func formattedPublishDate(book: Book) -> String {
    guard book.publishedAt != nil else { return "" }

    let formatter = DateFormatter()
    formatter.dateStyle = .long

    return formatter.string(from: book.publishedAt ?? Date())
  }
}

struct DetailView_Previews: PreviewProvider {
  static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

  static var previews: some View {
    let book = Book(context: moc)
    book.title = "Text book"
    book.author = "Test author"
    book.genre = "Fantasy"
    book.rating = 4
    book.review = "This was a great book; I really enjoyed it."

    return NavigationView {
      DetailView(book: book)
    }
  }
}
