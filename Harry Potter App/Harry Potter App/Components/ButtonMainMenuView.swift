//
//  ButtonMainMenuView.swift
//  Harry Potter App
//
//  Created by user240559 on 17/11/23.
//

import SwiftUI

struct ButtonMainMenuView: View {
    
    
    let image: String
    let backgroundColor: Color
    let radius: CGFloat
    let buttonTitle: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: radius)
                .foregroundColor(backgroundColor)
            VStack{
                Image(systemName: image)
                    .font(.largeTitle)
                Text(buttonTitle)
                    .font(.title3)
            }
        }
    }
}
//
//#Preview {
//    ButtonMainMenuView(image: "books.vertical.fill", backgroundColor: .green, radius: 8, buttonTitle: "Books") {}
//}
