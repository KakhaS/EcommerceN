//
//  UserDefaults.swift
//  Ecommerce
//
//  Created by Kakha on 10.03.24.
//

import Foundation

class AppData  {
    struct Constant {
        static let userNameKey =  "userNameKey"
        static let passwordKey = "passwordKey"
    }
    static let shared = AppData()
    
    var userName: String {
        didSet {
            UserDefaults.standard.setValue(userName, forKey: Constant.userNameKey)
        }
    }
    var password: String {
        didSet {
            UserDefaults.standard.setValue(password, forKey: Constant.passwordKey)
        }
    }
    
    private init() {
        self.userName = UserDefaults.standard.string(forKey: Constant.userNameKey) ?? ""
        self.password = UserDefaults.standard.string(forKey: Constant.passwordKey) ?? ""
        
    }
}

class ViewModel: ObservableObject {
    var userName: String = ""
    var password: String = ""
    
    func checkUser() {
        if AppData.shared.userName == userName {
            print("User has found")
        }
    }
    func saveUser() {
        AppData.shared.userName = userName
        AppData.shared.password = password
        print("Username has been saved")
    }
}
