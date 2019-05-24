//
//  Service.swift
//  AppStoreJSON
//
//  Created by James Fitch on 15/5/19.
//  Copyright © 2019 Fitchatron. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result]?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("failed to fetch apps:", err)
                completion(nil, nil)
                return
            }
            //success
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                completion(searchResult.results, nil)
            } catch let jsonErr {
                print("failed to decode JSON:", jsonErr)
                completion(nil, jsonErr)
            }
        }.resume()
    }
}
