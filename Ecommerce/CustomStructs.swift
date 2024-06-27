//
//  CustomStructs.swift
//  EcommerceTests
//
//  Created by Kakha on 05.03.24.
//

import SwiftUI


struct MyTextField: View {
    var imageName: String?
    var placeHolder: String
    var text: Binding<String>
    var isItPassword: Bool
    
    var body: some View {
        HStack {
            Image(systemName: imageName ?? "")
            if isItPassword {
                SecureField(placeHolder, text: text)
            } else {
                TextField(placeHolder, text: text )
            }
           
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
    }
}

struct MyButton: ButtonStyle {
    let myColor: Color
    let myOpacity: Double
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .padding()
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .semibold))
            .frame(width: 230, height: 40)
            .background(myColor)
            .cornerRadius(15)
            .opacity(myOpacity)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .padding()
    }
}


struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 2)
                .frame(width: 25, height: 25)
                .cornerRadius(5.0)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
            configuration.label
        }
        .padding()
    }
}
