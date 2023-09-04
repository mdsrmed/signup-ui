//
//  OTPVIew.swift
//  signup-ui
//
//  Created by Md Shohidur Rahman on 9/4/23.
//

import SwiftUI

struct OTPVIew: View {
    var body: some View {
        if #available(iOS 15, *){
            NavigationView{
                OTPVerificationVIew()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
            }
        } else {
            NavigationStack {
                OTPVerificationVIew()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(.hidden,for: .navigationBar)
            }
        }
    }
}

struct OTPVIew_Previews: PreviewProvider {
    static var previews: some View {
        OTPVIew()
    }
}
