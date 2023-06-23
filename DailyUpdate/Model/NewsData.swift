//
//  NewsData.swift
//  DailyUpdate
//
//  Created by Jigmet stanzin Dadul on 23/06/23.
//

import Foundation

struct APIResponse: Codable{
    let articles: [Articles]
}
struct Articles: Codable{
    let source: Source
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
}

struct Source:Codable{
    let id: String?
    let name: String?
}
