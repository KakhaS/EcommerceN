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
                MyTextField(placeHolder: viewModel.nameText, text: $viewModel.typedName, isItPassword: false)
                MyTextField(placeHolder: viewModel.surnameText, text: $viewModel.typedSurname, isItPassword: false)
                MyTextField(placeHolder: viewModel.emailText, text: $viewModel.typedEmail, isItPassword: false)
                MyTextField(placeHolder: viewModel.passwordText, text: $viewModel.typedPassword, isItPassword: true)
                MyTextField(placeHolder: viewModel.repeatPasswordText, text: $viewModel.typedRepeatedPassword, isItPassword: true)
                Toggle(isOn: $viewModel.isChecked){
                    Text(viewModel.termsConditionsText)
                }
                .toggleStyle(CheckboxToggleStyle())
                .alert(isPresented: $viewModel.alertIsOn, content: {
                    Alert(title: Text(viewModel.alertText))
                })
                
                Button(viewModel.signUpText) {
                    viewModel.RegistrationIsPressed()
                }
                .buttonStyle(MyButton(myColor: viewModel.isChecked ? .black : .blue, myOpacity: viewModel.isChecked ? 1.0 : 0.4))
            }
        }
    }
}
#Preview {
    RegistrationView()
}
