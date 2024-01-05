//
//  BookDetailView.swift
//  Harry Potter App
//
//  Created by user240559 on 21/11/23.
//

import SwiftUI

struct BookDetailView: View {
    let book: Book
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            RemoteImageView(url: book.bookAttributes.cover)
                .aspectRatio(contentMode: .fit)
            ScrollView {
                Text(book.bookAttributes.summary)
                    .fontWeight(.thin)
                    .padding(16)
            }
            Spacer()
        }
        .navigationTitle(book.bookAttributes.title)
        
    }
}

//#Preview {
//    BookDetailView(book: .example)
//}
