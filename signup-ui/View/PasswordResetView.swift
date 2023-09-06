//
//  PasswordResetView.swift
//  signup-ui
//
//  Created by Md Shohidur Rahman on 9/6/23.
//

import SwiftUI

struct PasswordResetView: View {
  
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            .padding(.top, 10)

     
            Text("Reset Password?")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 5)
            
           
            
            VStack(spacing: 25) {
                CustomTextField(sfIcon: "lock", hint: "Password", value: $password)
                CustomTextField(sfIcon: "lock", hint: "Confirm Password", value: $confirmPassword)
                    .padding(.top, 5)
               
                
             
                
                CustomButton(title: "Senk Link", icon: "arrow.right") {
                
                }
                .padding(.top,20)
                .disableWithOpacity1(password.isEmpty || confirmPassword.isEmpty )
                
                

            }
            .padding(.top, 20)
        }
        .padding(.vertical,15)
        .padding(.horizontal,25)
        .interactiveDismissDisabled()
    }
}

//struct PasswordResetView_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordResetView()
//    }
//}
