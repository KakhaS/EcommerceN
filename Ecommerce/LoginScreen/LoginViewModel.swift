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
    @Published var typedEmail: String = ""
    @Published var typedPassword: String = ""
    
    func SignInButtonPressed() {
        print("pressed")
    }
    func SignUpButtonPressed() {
        print("pressed")
    }
}

