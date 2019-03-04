//
//  NetworkDataLoader.swift
//  Astronomy
//
//  Created by Ilgar Ilyasov on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    
    func loadData(from request: URLRequest,
                  completion: @escaping (Data?, URLResponse?, Error?) -> Void)
    func loadData(from url: URL,
                  completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}


extension URLSession: NetworkDataLoader {
    
    func loadData(from request: URLRequest,
                  completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        dataTask(with: request, completionHandler: completion).resume()
    }
    
    func loadData(from url: URL,
                  completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        dataTask(with: url, completionHandler: completion).resume()
    }
    
}
