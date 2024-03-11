//
//  UserDefaults.swift
//  Ecommerce
//
//  Created by Kakha on 10.03.24.
//

import Foundation


class AppData {
    struct Constant {
        static let myKey =  "key"
    }
    
    static let shared = AppData()
    
    var userDictionary: [String : Any] {
        didSet {
            UserDefaults.standard.setValue(userDictionary, forKey: Constant.myKey)
        }
    }
    private init () {
        self.userDictionary = UserDefaults.standard.dictionary(forKey: Constant.myKey) ?? [:]
    }
}

class UserViewMode: ObservableObject {
    func saveUser(email: String, password: String) {
        if AppData.shared.userDictionary.index(forKey: email) == nil {
            AppData.shared.userDictionary.updateValue(email, forKey: password)
        }
    }
}
