//
//  CharacterRowView.swift
//  Harry Potter App
//
//  Created by user240559 on 8/12/23.
//

import SwiftUI

struct CharacterRowView: View {
    let character: Character
    
    var body: some View {
        VStack(spacing: 0.0) {
            HStack{
                
                if character.characterAttributes.image != nil {
                    RemoteImageView(url: character.characterAttributes.image!)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipped()
                } else {
                    Image(systemName: "person.fill").resizable().frame(width: 120, height: 120).clipShape(Circle())
                }
                
                VStack{
                    Text(character.characterAttributes.name)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    Text(character.characterAttributes.house ?? "Unknown")
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .bottom])
                
            }
        }
        .background(Color(.tertiarySystemFill))
        .cornerRadius(16)
    }
}
//
//#Preview {
//    CharacterRowView()
//}
