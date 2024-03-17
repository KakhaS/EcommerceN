//
//  LandingView.swift
//  Ecommerce
//
//  Created by Kakha on 13.03.24.
//

import SwiftUI

struct LandingView: View {
    @StateObject var viewModel: LandingViewModel
    
    init() {
    _viewModel = StateObject(wrappedValue: LandingViewModel())
    }
    
    var body: some View {
        HStack {
            Image(viewModel.mainLogo)
                .resizable()
                .frame(width: 150, height: 150)
                .padding()
        }
    }
}

#Preview {
    LandingView()
}
