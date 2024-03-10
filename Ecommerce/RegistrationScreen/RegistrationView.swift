//
//  RegistrationView.swift
//  Ecommerce
//
//  Created by Kakha on 04.03.24.
//

import SwiftUI


struct RegistrationView: View {
    @StateObject var viewModel: RegistrationViewModel
    init() {
        _viewModel = StateObject(wrappedValue: RegistrationViewModel())
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(viewModel.mainTitle)
                    .padding()
                MyTextField(placeHolder: viewModel.nameText, text: $viewModel.typedName)
                MyTextField(placeHolder: viewModel.surnameText, text: $viewModel.typedSurname)
                MyTextField(placeHolder: viewModel.emailText, text: $viewModel.typedEmail)
                MyTextField(placeHolder: viewModel.passwordText, text: $viewModel.typedPassword)
                MyTextField(placeHolder: viewModel.repeatPasswordText, text: $viewModel.typedRepeatedPassword)
                Toggle(isOn: $viewModel.isChecked){
                    Text(viewModel.termsConditionsText)
                }
                .toggleStyle(CheckboxToggleStyle())
                Button(viewModel.signUpText) {
                    print("SignUp Pressed")
                }
                .buttonStyle(MyButton(myColor: viewModel.isChecked ? .black : .blue, myOpacity: viewModel.isChecked ? 1.0 : 0.4))
            }
        }
    }
}
#Preview {
    RegistrationView()
}
