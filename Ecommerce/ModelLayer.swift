//
//  URLSession.swift
//  Ecommerce
//
//  Created by Kakha on 14.03.24.
//
import Foundation


struct ProductsContainer: Codable {
    let products: [Product]?
}

struct Product: Codable {
    let id: Int?
    let title, description: String?
    let price: Int?
    let discountPercentage, rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?
}



enum CustomError: Error {
    case urlIsNil
    case dataIsNil
    case error(with: String)
}


class ModelLayer {
    
//    func fetch(completion: @escaping (Result<[Product]?, CustomError>) -> ()) {
//      let stringUrl = "https://dummyjson.com/products"
//    
//        guard let url = URL(string: stringUrl) else {
//            completion(.failure(.urlIsNil))
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, _ , error in
//            guard error == nil else {
//                completion(.failure(.urlIsNil))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(.error(with: "Data is not found")))
//                return
//            }
//            
//            do {
//                let response = try JSONDecoder().decode(ProductsContainer.self, from: data)
//                completion(.success(response.products))
//            }
//            catch(let errorText) {
//                print(errorText)
//            }
//            
//        }.resume()
//        
//    }
    
    func fetchAsync() async -> Result<[Product]?, CustomError> {
        let stringUrl = "https://dummyjson.com/products"
          
        guard let url = URL(string: stringUrl) else { 
            return .failure(.urlIsNil)
        }
       
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(ProductsContainer.self, from: data)
            return .success(decodedData.products)
        }
        catch {
            return .failure(.dataIsNil)
        }
    }
}
