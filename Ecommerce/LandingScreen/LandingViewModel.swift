//
//  LandingViewController.swift
//  Ecommerce
//
//  Created by Kakha on 13.03.24.
//

import Foundation


class LandingViewModel: ObservableObject {
    let mainLogo: String = "MainLogo"
    
    @Published var products: [ContentViewData] = []
    @Published var isLoading: Bool = false
    
    private let modelLayer: ModelLayer
    
    init(modelLayer: ModelLayer = ModelLayer()) {
        self.modelLayer = modelLayer
    }
    
    func fetchMyData() {
     isLoading = true
    
        modelLayer.fetch {  result in
            switch result {
            case .success(let data):
                if let data = data {
                    let viewData = data.compactMap {
                        ContentViewData(id: $0.id ?? 0, brand: $0.brand ?? "No brand name", title: $0.title ?? "no tittle")
                    }
                    DispatchQueue.main.async {
                        self.products = viewData
                        self.isLoading = false
                        
                    }
                } else  { (print("data is nill in LandingViewModel")) }
            case .failure(let errorText):
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                print(errorText)
            }
            
        }
    }
    
    func fetchMyDataWithAsync() async {
        isLoading = true
        let result = await modelLayer.fetchAsync()
        await MainActor.run {
            switch result {
            case .success(let data):
                guard let data = data else { return }
                self.products = data.compactMap {
                    ContentViewData(id: $0.id ?? 0, brand: $0.brand ?? "", title: $0.title ?? "")
                }
                isLoading = false

            case .failure(let error):
                isLoading = false
                    print(error)
            }
        }
    }
}



struct ContentViewData: Identifiable {
    var id: Int
    var brand: String
    var title: String
}
