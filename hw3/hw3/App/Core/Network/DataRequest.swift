//
//  DataRequest.swift
//  hw3
//
//  Created by Berksu Kısmet on 6.10.2022.
//

import Foundation

protocol DataRequest {
    associatedtype Response
    var baseURL: String { get }
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: [String : String] { get }
    var queryItems: [String : String] { get }
    
    func decode(_ data: Data) throws -> Response
}

extension DataRequest where Response:Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}


extension DataRequest {
    var headers: [String : String]{
        [:]
    }
    
    var queryItems: [String : String]{
        [:]
    }
}
