//
//  CustomButton.swift
//  signup-ui
//
//  Created by Md Shohidur Rahman on 9/5/23.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var icon: String
    var onClick: () -> ()
    
    var body: some View {
        Button {
            onClick()
        } label: {
            HStack(spacing: 15){
                Text(title)
                Image(systemName: icon)
            }
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(.vertical,12)
            .padding(.horizontal,35)
            .background(.linearGradient(colors: [.black, .gray], startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
        }

    }
}

//struct CustomButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomButton()
//    }
//}
