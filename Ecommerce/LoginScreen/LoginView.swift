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
        NavigationStack {
                VStack {
                    Image(viewModel.mainLogo)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding()
                    Text(viewModel.mainTitle)
                        .padding()
                    MyTextField(imageName: viewModel.emailLogo, placeHolder: "Email...", text: $viewModel.typedEmail)
                    MyTextField(imageName: viewModel.passwordLogo, placeHolder: "Password...", text: $viewModel.typedPassword)
                    NavigationLink {
                   // navigation destination will go here
                    } label: {
                        Text(viewModel.signInText)
                    }
                    .buttonStyle(MyButton(myColor: .black, myOpacity: 1.0))
                    Divider()
                        .padding()
                    .buttonStyle(MyButton(myColor: .black, myOpacity: 1.0))
                    NavigationLink {
                      RegistrationView()
                    } label: {
                        Text(viewModel.signUpText)
                    }
                    .buttonStyle(MyButton(myColor: .black, myOpacity: 1.0))
                }
            Button {
                viewModel.showingAlert = true
            } label: {
                HStack {
                    Image(systemName: viewModel.appleLogo)
                    Text(viewModel.signInApple)
                }
                .alert(isPresented: $viewModel.showingAlert, content: {
                    Alert(title: Text(viewModel.alerText))
                })
            } .buttonStyle(MyButton(myColor: .black, myOpacity: 1.0))
            Spacer()
        }
                   }
}


#Preview {
    LoginView()
}

