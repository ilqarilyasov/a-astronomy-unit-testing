//
//  MockLoader.swift
//  AstronomyTests
//
//  Created by Ilgar Ilyasov on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
@testable import Astronomy

struct MockLoader: NetworkDataLoader {
    
    let data: Data?
    let error: Error?
    
    
    init(data: Data?, error: Error?) {
        self.data = data
        self.error = error
    }
    
    // MARK: - Protocol methods
    
    func loadData(from request: URLRequest,
                  completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        DispatchQueue.global().async {
            completion(self.data, nil, self.error)
        }
    }
    
    
    func loadData(from url: URL,
                  completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        DispatchQueue.global().async {
            completion(self.data, nil, self.error)
        }
    }
    
}
