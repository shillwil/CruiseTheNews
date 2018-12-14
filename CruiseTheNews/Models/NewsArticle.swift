//
//  NewsArticle.swift
//  CruiseTheNews
//
//  Created by Johnny Hicks on 12/13/18.
//  Copyright © 2018 Johnny Hicks. All rights reserved.
//

import Foundation

struct NewsArticle: Decodable {
    
    var author: String?
    var title: String
    var content: String?
}

struct Articles: Decodable {
    var articles: [NewsArticle]
}
