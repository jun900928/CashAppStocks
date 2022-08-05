//
//  NetworkService.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import Foundation

protocol Service {
    func request<T: Decodable>(request: Request, completion: @escaping (Result<T, Error>) -> Void)
    func parsing<T: Decodable>(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<T, Error>) -> Void)
}

public class NetworkService: Service {
    static let instance = NetworkService()
    var dataTask: URLSessionDataTask?
    
    private let defaultSession: URLSession
    private let decoder = JSONDecoder()
    private let timeoutIntervalForRequest = 10.0

    private init() {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = timeoutIntervalForRequest
        sessionConfig.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let session = URLSession(configuration: sessionConfig)
        self.defaultSession = session
    }

    func request<T: Decodable>(request: Request, completion: @escaping (Result<T, Error>) -> Void) {
        dataTask?.cancel()
        guard let url = request.url else {
            completion(.failure(NetworkError.badURL))
            return
        }
        dataTask = defaultSession.dataTask(with: url, completionHandler: { [weak self] (data, response, error) in
            guard let self = self else {return}
            defer { self.dataTask = nil }
            DispatchQueue.main.async {
                self.parsing(data: data, response: response, error: error, completion: completion)
            }
        })
        dataTask?.resume()
    }
    
    func parsing<T: Decodable>(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<T, Error>) -> Void){
        guard let data = data,
            let response = response as? HTTPURLResponse,
              response.statusCode == HTTPStatusCode.ok.rawValue else {
            completion(.failure(NetworkError.serverError))
            return
        }
        do {
            let response = try self.decoder.decode(T.self, from: data)
            completion(.success(response))
        } catch {
            print(error)
            completion(.failure(NetworkError.decodeFail))
        }
    }
}

