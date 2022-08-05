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
            case .badURL: return "An error occured with request url \nPlease try again later"
            case .serverError: return "An error occured while connecting server \nPlease try again later"
            case .decodeFail: return "An error occured while parsing the JSON response \nPlease try again later"
            case .emptyData: return "An empty data occured while request from server. \nPlease try again later"
        }
    }
}
