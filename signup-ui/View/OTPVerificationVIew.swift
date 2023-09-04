//
//  OTPVerificationVIew.swift
//  signup-ui
//
//  Created by Md Shohidur Rahman on 9/4/23.
//

import SwiftUI

struct OTPVerificationVIew: View {
    
    @State var otpText: String = ""
    @FocusState private var isKeyboardShowing: Bool
    
    var body: some View {
        VStack {
            Text("Verify OTP")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity,alignment: .leading)
            
            HStack(spacing: 0){
                ForEach(0..<6, id: \.self){ index in
                    
                    OTPTextBox(index)
                }
            }
            .background {
                TextField("", text: $otpText.limit(6))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .frame(width: 1, height: 1)
                    .opacity(0.001)
                    .blendMode(.screen)
                    .focused($isKeyboardShowing)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                isKeyboardShowing.toggle()
            }
            .padding(.top,10)
            .padding(.bottom, 20)

            
            TextField("", text: $otpText)
            
            Button {
                
            } label: {
                Text("Verify")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding(.vertical,12)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            .disableWithOpacity(otpText.count < 6)
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done"){
                    isKeyboardShowing.toggle()
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
            }
        }
    }
    
    @ViewBuilder
    func OTPTextBox(_ index: Int) -> some View {
        ZStack {
            if otpText.count > index {
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            } else {
                Text("")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            let status = (isKeyboardShowing && otpText.count == index)
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke(status ? .black : .gray, lineWidth: status ? 1 : 0.5)
                .animation(.easeInOut(duration: 0.2), value: status)
            
        }
        .frame(maxWidth: .infinity)
    }
  
}

struct OTPVerificationVIew_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerificationVIew()
    }
}



extension View {
    
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.5 : 1.0)
    }
    
    
}


// MARK: Binding <String> Extension

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}
