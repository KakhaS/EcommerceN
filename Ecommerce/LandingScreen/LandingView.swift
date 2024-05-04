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
                        Section {
                            HStack {
                                AsyncImage(url: URL(string: product.thumbnail)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: 100, maxHeight: 100)
                                } placeholder: {
                                    ProgressView()
                                        .progressViewStyle(.circular)
                                }
                                .padding()
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(product.title)
                                        .fontWeight(.bold)
                                    Text(product.brand)
                                        .fontWeight(.semibold)
                                    Text("Price $569")
                                        .fontWeight(.semibold)
                                    Text(product.description)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(3)
                                }
                                StepperCustombutton(stepperQuantity: $viewModel.stepCount)
                            }
                        }
                    header: {
                        Text(product.category)
                    }
                    }
                    
                }
                
            }
            
        }
        .onAppear(perform: {
            Task{ await viewModel.fetchMyDataWithAsync()}
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
                    .frame(maxWidth: 10, maxHeight: 10)
            }
                Text("\(stepperQuantity)")
                    .font(.system(size: 15))
                
                Button {
                    print("Plus")
                }
            label: {
                Image(systemName: "plus")
                    .foregroundColor(Color.black)
                    .frame(maxWidth: 10, maxHeight: 10)
            }
            }
        }
    }
}



#Preview {
    LandingView()
}
