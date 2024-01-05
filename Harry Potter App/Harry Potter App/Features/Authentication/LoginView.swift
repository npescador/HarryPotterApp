//
//  LoginView.swift
//  Harry Potter App
//
//  Created by user240559 on 10/12/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Label("Close", systemImage: "x.circle.fill")
                }
            }
            .padding(30)
            Spacer()
            Image(systemName: "person")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Group{
                TextField("Email", text: $email)
                    .padding(.top, 60)
                SecureField("Password", text: $password)
                                    
                Button{
                    viewModel.errorMessage = nil
                    viewModel.login(email: email, password: password)
                } label: {
                    Label("Login", systemImage: "person.badge.key")
                }
                .buttonStyle(.borderedProminent)
                
                if let messageError = viewModel.errorMessage {
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundStyle(.red)
                        .padding(.top, 20)
                }             }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

//#Preview {
//    LoginView()
//}
