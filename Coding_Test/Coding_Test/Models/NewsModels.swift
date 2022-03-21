//
//  NewsModels.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import Foundation


// MARK: - Welcome
struct APIResponseModel: Codable  {
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let title, articleDescription: String?
    let urlToImage: String?
}

