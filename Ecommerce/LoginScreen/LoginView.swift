//
//  LoginView.swift
//  Ecommerce
//
//  Created by Kakha on 04.03.24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack {
            Image(viewModel.mainLogo)
                .resizable()
                .frame(width: 150, height: 150)
                .padding()
            Text(viewModel.mainTitle)
                .padding()
            MyTextField(imageName: viewModel.emailLogo, text: "Email...")
            MyTextField(imageName: viewModel.passwordLogo, text: "Password...")
           MyButton(buttonText: "Sign In")
            Divider()
                .padding()
            MyButton(buttonText: "Sign Up")
        }
        Spacer()
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}

