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
    @State private var showForgotPasswordView: Bool = false
    @State private var showResetView: Bool = false
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
    
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
                    showForgotPasswordView.toggle()
                } label: {
                    Text("Forgot Password?")
                        .font(.callout)
                        .fontWeight(.bold)
//                        .foregroundColor(.gray)
                        .hSpacing(.trailing)
                }
                
                CustomButton(title: "Login", icon: "arrow.right") {
                    askOTP.toggle()
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
        .sheet(isPresented: $showForgotPasswordView) {
            if #available(iOS 16.4, *){
                ForgotPasswordView(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                ForgotPasswordView(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
            }
        }
        .sheet(isPresented: $showResetView) {
            if #available(iOS 16.4, *){
                PasswordResetView()
                    .presentationDetents([.height(400)])
                    .presentationCornerRadius(30)
            } else {
                PasswordResetView()
                    .presentationDetents([.height(400)])
            }
        }
        
        .sheet(isPresented: $askOTP) {
            if #available(iOS 16.4, *){
                OTPPresentationView(otpText: $otpText)
                    .presentationDetents([.height(400)])
                    .presentationCornerRadius(30)
            } else {
                OTPPresentationView(otpText: $otpText)
                    .presentationDetents([.height(400)])
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showSignup: .constant(false))
    }
}
