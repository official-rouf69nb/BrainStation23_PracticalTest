//
//  SearchResponseEntity.swift
//  BrainStation23_PracticalTest
//
//  Created by Md. Abdur Rouf on 6/7/22.
//

import Foundation

struct SearchResponseEntity: Codable {
    let page: Int
    let results: [MovieEntity]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
