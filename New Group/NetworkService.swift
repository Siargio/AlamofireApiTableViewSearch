//
//  NetworkService.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 8.11.22.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Characters]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Characters]?, Error>) -> Void) {
        
    }
}
