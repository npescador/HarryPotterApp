//
//  MoviewRowView.swift
//  Harry Potter App
//
//  Created by user240559 on 3/12/23.
//

import SwiftUI

struct MoviewRowView: View {
    let movie: MovieFavourite
    
    var body: some View {
        HStack(spacing: 0.0){
            
            RemoteImageView(url: movie.poster)
                .aspectRatio(contentMode: .fill)
                .frame(width: 120)
                .clipped()
            
            
            VStack{
                Text(movie.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text(movie.release_date)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .bottom])
            
        }
        .background(Color(.tertiarySystemFill))
        .cornerRadius(16)
        .overlay(alignment: .bottomTrailing){
            if movie.isFavourite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .offset(x: -20,y: -10)
            } else {
                Image(systemName: "star")
                    .foregroundColor(.yellow)
                    .offset(x: -20,y: -15)
            }
        }
    }
}

//#Preview {
//    MoviewRowView()
//}
