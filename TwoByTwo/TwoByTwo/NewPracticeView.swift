//
//  NewPracticeView.swift
//  TwoByTwo
//
//  Created by Vitali Tatarintev on 01.02.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct NewAnswerButton: View {
  let label: String
  let width: CGFloat
  let backgroundColor: Color
  let action: () -> Void

  var body: some View {
    Button(action: self.action) {
      Text(self.label)
    }
    .font(.largeTitle)
    .frame(width: self.width, height: 50)
    .padding(35)
    .foregroundColor(.white)
    .background(self.backgroundColor)
    .clipShape(RoundedRectangle(cornerRadius: 10))
    .animation(.easeInOut)
  }
}

struct NewPracticeView: View {
  @Environment(\.horizontalSizeClass) var sizeClass

  var body: some View {
    GeometryReader { geo in
      VStack {
        HStack {
          Text("1/10")

          Spacer()

          Button(action: {

          }) {
            Image(systemName: "xmark")
              .foregroundColor(.red)
          }
        }
        .font(.headline)
        .frame(width: self.screenWidth(geo))
        .padding()

        GeometryReader { _ in
          VStack {
            Text("2 x 2 = ?")
              .font(.largeTitle)
              .padding(.bottom, 30)

            if self.sizeClass == .compact {
              VStack(alignment: .center) {
                HStack {
                  NewAnswerButton(label: "1", width: self.answerButtonWidth(geo, 2), backgroundColor: Color.orange, action: {

                  })

                  NewAnswerButton(label: "2", width: self.answerButtonWidth(geo, 2), backgroundColor: Color.orange, action: {

                  })

                }
                .padding(.bottom, 10)

                HStack {
                  NewAnswerButton(label: "3", width: self.answerButtonWidth(geo, 2), backgroundColor: Color.orange, action: {

                  })

                  NewAnswerButton(label: "4", width: self.answerButtonWidth(geo, 2), backgroundColor: Color.orange, action: {

                  })
                }
              }
            } else {
              HStack(alignment: .center) {
                NewAnswerButton(label: "1", width: self.answerButtonWidth(geo, 4), backgroundColor: Color.orange, action: {

                })

                NewAnswerButton(label: "2", width: self.answerButtonWidth(geo, 4), backgroundColor: Color.orange, action: {

                })
                NewAnswerButton(label: "3", width: self.answerButtonWidth(geo, 4), backgroundColor: Color.orange, action: {

                })
                NewAnswerButton(label: "4", width: self.answerButtonWidth(geo, 4), backgroundColor: Color.orange, action: {

                })
              }
            }
          }
        }

        HStack {
          Button(action: {

          }) {
            Image(systemName: "forward.fill")
          }
          .padding(25)
          .frame(width: self.screenWidth(geo))
          .background(Color.blue)
          .foregroundColor(.white)
          .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
      }
    }
  }

  func screenWidth(_ geo: GeometryProxy) -> CGFloat {
    geo.size.width * 0.9
  }

  func answerButtonWidth(_ geo: GeometryProxy, _ buttonsPerLine: CGFloat) -> CGFloat {
    self.screenWidth(geo) / buttonsPerLine - 76 // 76 here calculated in the experimental way
  }
}

struct NewPracticeView_Previews: PreviewProvider {
  static var previews: some View {
    NewPracticeView()
  }
}
