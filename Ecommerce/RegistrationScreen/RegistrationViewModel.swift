//
//  RegistrationViewModel.swift
//  Ecommerce
//
//  Created by Kakha on 04.03.24.
//
import SwiftUI
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
    let alertText: String = "Please check if Passwords match or Email is in correct format."
    @Published var alertIsOff: Bool = false
    @Published var isChecked: Bool = false
    @Published var typedName: String = ""
    @Published var typedSurname: String = ""
    @Published var typedEmail: String = ""
    @Published var typedPassword: String = ""
    @Published var typedRepeatedPassword: String = ""
    
    func RegistrationIsPressed() {
        if validateRegistration() {
            UserViewModel().saveUser(email: typedEmail, password: typedPassword)
        } else {
            alertIsOff = true
        }
    }
    
    func validateRegistration() -> Bool {
        if validateEmail() && validatePassword() && validateTextFields() {
            return true
        } else {
            return false
        }
    }
    
    func validateEmail() -> Bool {
        if typedEmail.contains("@") {
            return true
        } else {
            return false
        }
    }

    func validatePassword() -> Bool {
        if typedPassword.isEmpty && typedPassword != typedRepeatedPassword {
            return false
        } else {
            return true
        }
    }

    func validateTextFields() -> Bool {
        if typedName.isEmpty && typedSurname.isEmpty && typedPassword.isEmpty && typedRepeatedPassword.isEmpty {
            return false
        } else {
            return true
        }
    }
}


