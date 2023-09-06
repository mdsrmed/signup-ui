//
//  Signup.swift
//  signup-ui
//
//  Created by Md Shohidur Rahman on 9/6/23.
//

import SwiftUI

struct Signup: View {
    @Binding var showSignup: Bool
    @State private var email: String = ""
    @State private var fullName:String = ""
    @State private var password: String = ""
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Button {
                showSignup = false
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            .padding(.top, 10)

     
            Text("Signup")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 25)
            
            Text("Please sign up to continue")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                CustomTextField(sfIcon: "at", hint: "Email", value: $email)
                CustomTextField(sfIcon: "person", hint: "Full Name",
                                value: $fullName)
                .padding(.top,5)
                
                CustomTextField(sfIcon: "lock", hint: "Password",isPassword: true,
                                value: $password)
                .padding(.top,5)
                
                
             
                
                CustomButton(title: "Continue", icon: "arrow.right") {
                    askOTP.toggle()
                }
                .padding(.top,20)
                .disableWithOpacity1(email.isEmpty || password.isEmpty || fullName.isEmpty)
                
                Spacer()
                
                HStack(spacing: 3){
                    Text("Already have an account?")
                        .font(.callout)
                        .foregroundColor(.gray)
                    Button {
                        showSignup = false
                    } label: {
                        Text("Login")
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


//struct Signup_Previews: PreviewProvider {
//    static var previews: some View {
//        Signup()
//    }
//}
