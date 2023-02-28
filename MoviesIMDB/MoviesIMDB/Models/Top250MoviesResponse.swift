//
//  Top250MoviesResponse.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import Foundation

struct Top250MoviesResponse: Codable {
    var items: [Movie]?
    var errorMessage: String?
}
