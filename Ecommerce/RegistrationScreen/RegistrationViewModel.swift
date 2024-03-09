//
//  RegistrationViewModel.swift
//  Ecommerce
//
//  Created by Kakha on 04.03.24.
//

import Foundation


class RegistrationViewModel: ObservableObject {
    let mainTitle: String = "Registration form"
    @Published var isChecked = false
    @Published var typedName: String = ""
    @Published var typedSurname: String = ""
    @Published var typedEmail: String = ""
    @Published var typedPassword: String = ""
    @Published var typedRepeatedPassword: String = ""
    
    func RegistrationIsPressed() {
        print("pressed")
    }
}


