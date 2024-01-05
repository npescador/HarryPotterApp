//
//  LoginView.swift
//  Harry Potter App
//
//  Created by user240559 on 10/12/23.
//

import SwiftUI

enum AuthenticationSheetView: String, Identifiable {
    case login
    case register
    
    var id: String {
        return rawValue
    }
}

struct AuthenticationView: View {
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var authenticationSheetView: AuthenticationSheetView?

    var body: some View {
        NavigationStack{
            VStack{
                
                Image("login_image")
                    .resizable()
                    .frame(width: 500, height: 300)
                
                Button {
                    authenticationSheetView = .login
                } label: {
                    Label("Signin", systemImage: "envelope.fill")
                        .tint(.white)
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 40)
                
                
                Button {
                    authenticationSheetView = .register
                } label: {
                    Text("RegisterNow")
                        .tint(.white)
                        .underline()
                }
                .padding(.top, 20)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .sheet(item: $authenticationSheetView) { sheet in
                switch sheet {
                case .login:
                    coordinator.makeLoginView()
                case .register:
                    coordinator.makeRegisterView()
                }
            }
        }
    }
}

//#Preview {
//    LoginView()
//}

