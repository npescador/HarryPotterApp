//
//  SpellDetailView.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import SwiftUI

struct SpellDetailView: View {
    
    let spell: Spell
    
    var body: some View {
        VStack{
            
            Text(spell.spellAttributes.name)
                .font(.title)
            
            if spell.spellAttributes.image != nil {
                RemoteImageView(url: spell.spellAttributes.image!)
                    .frame(width: 300, height: 400)
                    .aspectRatio(contentMode: .fit)

            }
            
            Text("Category \(spell.spellAttributes.cartegory ?? "NA")")
            Text("Hand \(spell.spellAttributes.hand ?? "NA")")
            Text("Effect \(spell.spellAttributes.effect ?? "NA")")
            Text("Light \(spell.spellAttributes.light ?? "NA")")
        }
    }
}


//
//#Preview {
//    SpellDetailView()
//}
