//
//  NetworkError.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/4/22.
//

import Foundation

enum NetworkError: Error {
    case badURL, serverError, decodeFail, emptyData
    
    var localizedDescription: String {
        switch self {
            case .badURL: return "An error occured with request url"
            case .serverError: return "An error occured while connecting server"
            case .decodeFail: return "An error occured while parsing the JSON response"
            case .emptyData: return "An empty data occured while request from server"
        }
    }
}
