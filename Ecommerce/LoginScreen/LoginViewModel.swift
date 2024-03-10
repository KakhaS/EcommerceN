//
//  LoginViewModel.swift
//  Ecommerce
//
//  Created by Kakha on 04.03.24.
//

import Foundation

class LoginViewModel: ObservableObject {
    let mainLogo: String = "MainLogo"
    let mainTitle: String = "Greetings"
    let emailLogo: String = "tray.circle"
    let passwordLogo: String = "lock.circle"
    let signInText: String = "Sign in"
    let signUpText: String = "Sign up"
    let appleLogo: String = "apple.logo"
    let signInApple: String = "Sign in with Apple"
    let alerText: String = "Sign in with Apple is not available yet."
    @Published var typedEmail: String = ""
    @Published var typedPassword: String = ""
    @Published var showingAlert: Bool = false
    
    func SignInButtonPressed() {
        print("pressed")
    }
    func SignUpButtonPressed() {
        print("pressed")
    }
}

