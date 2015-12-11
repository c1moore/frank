//
//  ArticleFetcher.swift
//  frank
//
//  Created by Cory Armstrong on 12/11/15.
//  Copyright © 2015 frank. All rights reserved.
//

import Foundation

class ArticleFetcher {
    private var pointer = 0;
    private let type: ArticleFetcherType;
    
    init(fetcherType: ArticleFetcherType) {
        self.type = fetcherType;
    }
    
    /**
     * Fetches the numberOfRecords records from the frank server in the order specified by `ArticleFetcherType`.
     *
     * Parameter numberOfRecords: the total number of records to return.
     *
     * Returns: an array of type `frankArticle` in chronological order
     */
    func fetchArticles(numberOfRecords records: Int) -> [frankArticle] {
        return [frankArticle()]
    }
    
    /**
     * Fetches the most recent records from the frank server without adjusting the internal pointer.
     */
    
    /**
     * Resets the internal pointer so the most recent articles are returned.
     */
}

enum ArticleFetcherType {
    case MostRecent;
    case MostPopular;
}