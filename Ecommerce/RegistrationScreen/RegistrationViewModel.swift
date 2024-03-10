//
//  RegistrationViewModel.swift
//  Ecommerce
//
//  Created by Kakha on 04.03.24.
//

import Foundation


class RegistrationViewModel: ObservableObject {
    let mainTitle: String = "Registration form"
    let nameText: String = "Name..."
    let surnameText: String = "Surname..."
    let usernameText: String = "Username..."
    let emailText: String = "Email..."
    let passwordText: String = "Password..."
    let repeatPasswordText: String = "Repeat Password..."
    let signUpText: String = "Sign up"
    let termsConditionsText: String = "I Agree Terms & Conditions."
    @Published var isChecked = false
    @Published var typedName: String = ""
    @Published var typedSurname: String = ""
    @Published var typedEmail: String = ""
    @Published var typedPassword: String = ""
    @Published var typedRepeatedPassword: String = ""
    
    func RegistrationIsPressed() {
        UserViewModel().checkUser()
    }
}


