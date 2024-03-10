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
        VStack {
            Text(viewModel.mainTitle)
                .padding()
            MyTextField(placeHolder: "Name...", text: $viewModel.typedName)
            MyTextField(placeHolder: "Surname...", text: $viewModel.typedSurname)
            MyTextField(placeHolder: "Email...", text: $viewModel.typedEmail)
            MyTextField(placeHolder: "Password...", text: $viewModel.typedPassword)
            MyTextField(placeHolder: "Repeat Password...", text: $viewModel.typedRepeatedPassword)
            Toggle(isOn: $viewModel.isChecked){
                Text("I Agre terms and conditions")
            }
            .toggleStyle(CheckboxToggleStyle())
            Button("Sign Up") {
                print("SignUp Pressed")
            }
            .buttonStyle(MyButton(myColor: viewModel.isChecked ? .black : .blue, myOpacity: viewModel.isChecked ? 1.0 : 0.4))
        }
    }
}
#Preview {
    RegistrationView()
}
