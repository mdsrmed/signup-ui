//
//  OTPPresentationView.swift
//  signup-ui
//
//  Created by Md Shohidur Rahman on 9/6/23.
//

import SwiftUI

struct OTPPresentationView: View {
    @Binding var otpText: String

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

     
            Text("Enter OTP")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 5)
            
            Text("A 6 digit code has been sent to your email.")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                
                OTPVerificationVIew(otpText: $otpText)
                
                CustomButton(title: "Senk Link", icon: "arrow.right") {
                    
                }
                .padding(.top,20)
                .disableWithOpacity1(otpText.isEmpty)
                
                

            }
            .padding(.top, 20)
            Spacer(minLength: 0)
        }
        .padding(.vertical,15)
        .padding(.horizontal,25)
        .interactiveDismissDisabled()
    }
}

//struct OTPPresentationView_Previews: PreviewProvider {
//    static var previews: some View {
//        OTPPresentationView()
//    }
//}
