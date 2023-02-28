//
//  Movie.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import Foundation

struct Movie: Codable, Hashable {
    var id: String?
    var rank: String?
    var title: String?
    var fullTitle: String?
    var year: String?
    var image: String?
    var crew: String?
    var imDbRating: String?
    var imDbRatingCount: String?
}
