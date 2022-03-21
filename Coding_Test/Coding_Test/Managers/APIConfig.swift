//
//  APIConfig.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import Foundation

public final class APIConfig {
    
    static let shared: APIConfig = APIConfig()
    
    let scheme: String
    let host: String
    let country: String
    let baseURL: String
    let key: String
    
    private init() {
        
        let plistPath = Bundle.main.path(forResource: "Info", ofType: "plist")
        guard let info = NSDictionary(contentsOfFile: plistPath ?? "") else {
            
            fatalError("Unable to parse plist into dictionary")
        }
        
        guard let host = info.object(forKey: "Host") else {
            
            fatalError("Host is required in info.plist")
        }
        
        guard let scheme = info.object(forKey: "Scheme") else {
            
            fatalError("Scheme is required in info.plist")
        }
        
        guard let country = info.object(forKey: "Country") else {
            
            fatalError("Country is required in info.plist")
        }
        
        guard let key = info.object(forKey: "Key") else {
            
            fatalError("API Key is required in info.plist")
        }
        
        self.scheme  = scheme as? String ?? "" //https
        self.host    = host as? String ?? "" // newsapi.org/v2/top-headlines
        self.country = country as? String ?? "" // in
        self.key  = key as? String ?? ""
        self.baseURL = "\(self.scheme)://\(self.host)?country=\(self.country)&apiKey=\(self.key)"
    }
    
}
