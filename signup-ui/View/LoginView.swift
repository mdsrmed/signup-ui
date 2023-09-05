//
//  LoginView.swift
//  signup-ui
//
//  Created by Md Shohidur Rahman on 9/5/23.
//

import SwiftUI

struct LoginView: View {
    @Binding var showSignup: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            Text("Login")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Please sign in to continue")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                CustomTextField(sfIcon: "at", hint: "Email", value: $email)
                CustomTextField(sfIcon: "lock", hint: "Password",isPassword: true,
                                value: $password)
                .padding(.top,5)
                
                
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.callout)
                        .fontWeight(.bold)
//                        .foregroundColor(.gray)
                        .hSpacing(.trailing)
                }
                
                CustomButton(title: "Login", icon: "arrow.right") {
                    
                }
                .padding(.top,20)
                .disableWithOpacity1(email.isEmpty || password.isEmpty)
                
                Spacer()
                
                HStack(spacing: 3){
                    Text("Don't have an account?")
                        .font(.callout)
                        .foregroundColor(.gray)
                    Button {
                        showSignup.toggle()
                    } label: {
                        Text("Signup")
                            .font(.callout)
                            .tint(.black)
                            .fontWeight(.bold)
                    }

                }

            }
            .padding(.top, 20)
        }
        .padding(.vertical,15)
        .padding(.horizontal,25)
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showSignup: .constant(false))
    }
}
