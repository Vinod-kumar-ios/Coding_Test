//
//  NewsViewModel.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]?
}

extension ArticleListViewModel {
    
    func numberOfRowsInSection(_ section: Int) -> Int? {
        return self.articles?.count
    }
    
    func articleAtIndex(_ index: Int) -> Article? {
        return articles?[index]
    }
    
}
