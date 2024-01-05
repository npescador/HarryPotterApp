//
//  RemoteImageView.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import SwiftUI
import Kingfisher

struct RemoteImageView: View {
    let url: String
    
    var body: some View {
        KFImage(URL(string: url))
            .resizable()
    }
}

//#Preview {
//    RemoteImageView()
//}
