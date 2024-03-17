//
//  URLSession.swift
//  Ecommerce
//
//  Created by Kakha on 14.03.24.
//

import Foundation


struct Products: Codable {
    let id: Int
    let title: String
    let productDescription: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}


class ProductModel: ObservableObject {
    @Published var products: [Products] = []
    
    
    func fetchData() {
        let URLString: String =  "https://dummyjson.com/products"
        guard let url = URL(string: URLString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _ , error in
            guard let data = data, error == nil  else { return }
            do {
                let products = try JSONDecoder().decode([Products].self, from: data)
                DispatchQueue.main.async {
                    self?.products = products
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        
    }
    
}

