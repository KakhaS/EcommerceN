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
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List {
                    ForEach(viewModel.products) { product in
                        HStack {
                            Image("TestPic")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                                .clipShape(.circle)
                            VStack(alignment: .leading, spacing: 10) {
                                Text(product.title)
                                    .fontWeight(.bold)
                                Text(product.brand)
                                    .fontWeight(.semibold)
                                Text("Price $569")
                                    .fontWeight(.semibold)
                            }
                                StepperCustombutton(stepperQuantity: $viewModel.stepCount)
                        }
                    }
          
                }
                    
            }
            
        }
        .onAppear(perform: {
            Task{ await viewModel.fetchMyDataWithAsync() }
        })
    }
}


struct StepperCustombutton: View {
    @Binding var stepperQuantity: Int
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    print("minus")
                }
            label: {
                Image(systemName: "minus")
                    .foregroundColor(Color.black)
                    .frame(maxWidth: 20, maxHeight: 20)
                }
                Text("\(stepperQuantity)")
                    .font(.system(size: 30))
                    .padding()
                Button {
                    print("Plus")
                }
            label: {
                Image(systemName: "plus")
                    .foregroundColor(Color.black)
                    .frame(maxWidth: 20, maxHeight: 20)
            }
            }
        }
        .padding()
    }
}



#Preview {
    LandingView()
}
