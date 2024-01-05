//
//  SpellRowView.swift
//  Harry Potter App
//
//  Created by user240559 on 8/12/23.
//

import SwiftUI

struct SpellRowView: View {
    let spell: Spell
     
    var body: some View {
        HStack(spacing: 0.0){
            
            if spell.spellAttributes.image != nil {
                RemoteImageView(url: spell.spellAttributes.image!)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 100)
                    .clipped()
            } else {
                Image(systemName: "info.circle").resizable().frame(width: 80, height: 80).clipShape(Circle())
            }
            
            Text(spell.spellAttributes.name)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
        .background(Color(.tertiarySystemFill))
        .cornerRadius(16)
    }
}

//#Preview {
//    SpellRowView()
//}
