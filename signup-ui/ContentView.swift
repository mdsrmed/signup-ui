//
//  ContentView.swift
//  signup-ui
//
//  Created by Md Shohidur Rahman on 9/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSignup: Bool = false
    var body: some View {
        NavigationStack {
            LoginView(showSignup: $showSignup)
                .navigationDestination(isPresented: $showSignup) {
                    
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
