//
//  Webservice.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import Foundation

public enum APIError: String, Error {
    case badURL = "Please check url"
    case badRequest
    case decodeIssue = "Not Decodable"
    case dataNotFound
}


struct Webservice {
    func execute(from urlString: String, completionHandler: @escaping (Result<APIResponseModel, APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            if error != nil {
                completionHandler(.failure(.badRequest))
            } else if let data = data {
                guard let decodedResponse = try? JSONDecoder().decode(APIResponseModel.self, from: data) else{
                    completionHandler(.failure(.decodeIssue))
                    return
                }
                completionHandler(.success(decodedResponse))
            }
            
        }.resume()
    }
}

extension Webservice{
    func getArticles(endPoint: String, completion: @escaping (Result<APIResponseModel, APIError>) -> Void) {
        self.execute(from: endPoint) { (result) in
            completion(result)
        }
    }
}


