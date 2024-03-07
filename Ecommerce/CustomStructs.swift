//
//  CustomStructs.swift
//  EcommerceTests
//
//  Created by Kakha on 05.03.24.
//

import SwiftUI


struct MyTextField: View {
    var imageName: String
    var text: String
    
    var body: some View {
        @State var email: String = ""
        HStack {
            Image(systemName: imageName)
            TextField(text, text: $email)
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
    }
    
}

struct MyButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .padding()
                   .foregroundColor(.white)
                                 .font(.system(size: 16, weight: .semibold))
                                 .frame(width: 150, height: 40)
                                 .background(.black)
                                 .cornerRadius(15)
                        .scaleEffect(configuration.isPressed ? 1.2 : 1)
                        .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
