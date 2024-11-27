//
//  APIServiceWithAlamofire.swift
//  APISuperHero
//
//  Created by Alibek Baisholanov on 27.11.2024.
//

import Foundation
import Alamofire

class APIServiceWithAlamofire{
    static let shared = APIServiceWithAlamofire();
    private init(){}
    
    func fetchData(from url: String, completion: @escaping(Result<SuperHero, Error>) -> ()){
        AF.request(url) // тут выполняется сам HTTP запрос через Alamofire
            .validate() // проверяется статус запроса и пропускает только от 200 до 299
            .response{ response in // возвращается обьект response
                guard let data = response.data else{ // раскрыли опциональную data
                    if let error = response.error{
                        completion(.failure(error))
                    }
                    return
                }
                
                //декодируем
                let decoder = JSONDecoder()
                guard let results = try? decoder.decode(SuperHero.self, from: data) else {
                    completion(.failure(URLError(.cannotDecodeContentData)))
                    return
                }
                
                //если все успешно
                completion(.success(results))

            }
        
    }
}
