//
//  BookRowView.swift
//  Harry Potter App
//
//  Created by user240559 on 3/12/23.
//

import SwiftUI

struct BookRowView: View {
    let book:Book
    
    var body: some View {
        VStack(spacing: 0.0){
            RemoteImageView(url: book.bookAttributes.cover)
                .aspectRatio(contentMode: .fill)
                .frame(height: 80)
                .clipped()
            Text(book.bookAttributes.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            Text(book.bookAttributes.author)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .bottom])
        }
        .background(Color(.tertiarySystemFill))
        .cornerRadius(16)
    }
}

//#Preview {
//    BookRowView()
//}
