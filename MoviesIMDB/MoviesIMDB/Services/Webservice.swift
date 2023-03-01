//
//  Webservice.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import Foundation
import Alamofire

class WebService {
    private let baseURL = URL(string: "https://imdb-api.com/en/API")!
    private let token = "lizKB0SnLKAmxVndMwJGFtz1KBpzhSLX6Ggh4zuGfGqVlDGY8Dc"
    
    func getTop250Movies(completion: @escaping (_ result: Result<[Movie], Error>) -> Void) {
        let request = baseURL.appending(path: "/Top250Movies/k_vdsxo77n")
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let dataResponse = data, error == nil else { return }
            do {
                let decoder = try JSONDecoder().decode(Top250MoviesResponse.self, from: dataResponse)
                let movies : [Movie] = decoder.items ?? []
                completion(.success(movies))
            } catch let error {
                completion(.failure(error))
            }
        }).resume()
    }
    
    func getTitle(movie: Movie, completion: @escaping (_ result: Result<Movie, Error>) -> Void) {
        guard let id = movie.id else { return }
        let request = baseURL.appending(path: "/Title/k_vdsxo77n/\(id)")
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let dataResponse = data, error == nil else { return }
            do {
                let movieDecoder = try JSONDecoder().decode(Movie.self, from: dataResponse)
                completion(.success(movieDecoder))
            } catch let error {
                completion(.failure(error))
            }
        }).resume()
    }
}
