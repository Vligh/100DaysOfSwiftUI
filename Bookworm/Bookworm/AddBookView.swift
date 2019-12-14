//
//  AddBookView.swift
//  Bookworm
//
//  Created by Vitali Tatarintev on 11.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct AddBookView: View {
  @Environment(\.managedObjectContext) var moc
  @Environment(\.presentationMode) var presentationMode

  @State private var title = ""
  @State private var author = ""
  @State private var rating = 3
  @State private var genre = ""
  @State private var review = ""
  @State private var publishedAt = Date()

  let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller", "Learning & Development"]

  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Name of book", text: $title)
          TextField("Author's name", text: $author)

          Picker("Genre", selection: $genre) {
            ForEach(genres, id: \.self) {
              Text($0)
            }
          }

          DatePicker("Publish date", selection: $publishedAt, in: ...Date(), displayedComponents: .date)
        }

        Section {
          RatingView(rating: $rating, label: "Rating")
          TextField("Write a review", text: $review)
        }

        Section {
          Button("Save") {
            let newBook = Book(context: self.moc)
            newBook.title = self.title
            newBook.author = self.author
            newBook.rating = Int16(self.rating)
            newBook.genre = self.genre
            newBook.review = self.review
            newBook.publishedAt = self.publishedAt

            try? self.moc.save()

            self.presentationMode.wrappedValue.dismiss()
          }
        }
      }
      .navigationBarTitle("Add Book")
    }
  }
}

struct AddBookView_Previews: PreviewProvider {
  static var previews: some View {
    AddBookView()
  }
}
