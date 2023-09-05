//
//  CustomTextField.swift
//  signup-ui
//
//  Created by Md Shohidur Rahman on 9/5/23.
//

import SwiftUI

struct CustomTextField: View {
    
    var sfIcon: String
    var iconTint: Color = .gray
    var hint: String
    var isPassword: Bool = false
    @Binding var value: String
    @State private var showPassword: Bool = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
           Image(systemName: sfIcon)
                .foregroundStyle(iconTint)
                .frame(width: 30)
                .offset(y: 2)
            
           VStack(alignment: .leading, spacing: 8){
                if isPassword {
                    Group {
                        if showPassword {
                            TextField(hint,text: $value)
                        } else {
                            SecureField(hint, text: $value)
                        }  
                    }
                } else {
                    TextField(hint, text: $value)
                }
                
                Divider()
            }
             .overlay(alignment: .trailing) {
               
                 if isPassword {
                     Button {
                         withAnimation {
                             showPassword.toggle()
                         }
                     } label: {
                         Image(systemName: showPassword ? "eye.slash" : "eye")
                             .foregroundColor(.gray)
                             .padding(10)
      //                       .contentShape( )
                     }

                 }
           }
        }
    }
}

//struct CustomTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTextField()
//    }
//}
