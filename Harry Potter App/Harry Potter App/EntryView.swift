//
//  EntryView.swift
//  Harry Potter App
//
//  Created by user240559 on 16/12/23.
//

import SwiftUI

struct EntryView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel: AuthenticationViewModel
    var hasPersistedSignedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    init(viewModel: AuthenticationViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        if viewModel.state == .signedOut && !hasPersistedSignedIn {
            coordinator.makeAuthenticationView()
                .environmentObject(coordinator)
                .environmentObject(viewModel)
        } else {
            coordinator.makeHomeView()
                .environmentObject(coordinator)
                .environmentObject(viewModel)
        }
    }
}

//#Preview {
//    EntryView()
//}
