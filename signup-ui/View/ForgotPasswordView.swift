//
//  ForgotPasswordView.swift
//  signup-ui
//
//  Created by Md Shohidur Rahman on 9/6/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Binding var showResetView: Bool
//    @Binding var showSignup: Bool
    @State private var email: String = ""
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            .padding(.top, 10)

     
            Text("Forgot Password?")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 5)
            
            Text("Please enter your email for verification and reset link")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                CustomTextField(sfIcon: "at", hint: "Email", value: $email)
               
                
             
                
                CustomButton(title: "Senk Link", icon: "arrow.right") {
                    Task {
                        dismiss()
                        try? await Task.sleep(for: .seconds(0))
                        showResetView = true
                    }
                }
                .padding(.top,20)
                .disableWithOpacity1(email.isEmpty)
                
                

            }
            .padding(.top, 20)
        }
        .padding(.vertical,15)
        .padding(.horizontal,25)
        .interactiveDismissDisabled()
    }
}

//struct ForgotPasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForgotPasswordView()
//    }
//}
