//
//  LoginView.swift
//  Ecommerce
//
//  Created by Kakha on 04.03.24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: LoginViewModel())
    }
    
    var body: some View {
            VStack {
                Image(viewModel.mainLogo)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding()
                Text(viewModel.mainTitle)
                    .padding()
                MyTextField(imageName: viewModel.emailLogo, placeHolder: "Email...", text: $viewModel.typedEmail)
                MyTextField(imageName: viewModel.passwordLogo, placeHolder: "Password...", text: $viewModel.typedPassword)
                Button("SignIn") {
                    print("Sing in Pressed ")
                }
                .buttonStyle(MyButton(myColor: .black, myOpacity: 1.0))
                Divider()
                    .padding()
                Button("SignUp") {
                    print("Sign UP ")
                
                    
                }
                .buttonStyle(MyButton(myColor: .black, myOpacity: 1.0))
            }
        Spacer()
    }
}


#Preview {
    LoginView()
}

