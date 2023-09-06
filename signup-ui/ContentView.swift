//
//  ContentView.swift
//  signup-ui
//
//  Created by Md Shohidur Rahman on 9/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSignup: Bool = false
    @State private var isKeyboardShowing: Bool = false
    var body: some View {
        NavigationStack {
            LoginView(showSignup: $showSignup)
                .navigationDestination(isPresented: $showSignup) {
                    Signup(showSignup: $showSignup)
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification),perform: { _ in
                    isKeyboardShowing = true
                    if !showSignup {
                        isKeyboardShowing = true
                    }
                })
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification),perform: { _ in
                    isKeyboardShowing = false
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
