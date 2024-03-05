//
//  LoginView.swift
//  Ecommerce
//
//  Created by Kakha on 04.03.24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        Image(viewModel.mainLogo)
            .resizable()
            .frame(width: 150, height: 150)
            .padding()
        Text(viewModel.mainTitle)
   
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
