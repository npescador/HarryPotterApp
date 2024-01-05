//
//  PotionDetailView.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import SwiftUI

struct PotionDetailView: View {
    let potion: Potion
    
    var body: some View {
        VStack{
            
            Text(potion.attributes.name ?? "NA")
                .font(.title)
            Spacer()
            if potion.attributes.image != nil {
                RemoteImageView(url: potion.attributes.image!)
                    .frame(width: 300, height: 400)
                    .aspectRatio(contentMode: .fit)
            }
            
            Text("Characteristics \(potion.attributes.characteristics ?? "NA")")
            Text("Difficulty \(potion.attributes.difficulty ?? "NA")")
            Text("Effect \(potion.attributes.effect ?? "NA")")
            Text("Time \(potion.attributes.time ?? "NA")")
            Spacer()
        }
    }
}

//#Preview {
//    PotionDetailView()
//}
