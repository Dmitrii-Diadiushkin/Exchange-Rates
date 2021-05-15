//
//  NetworkManager.swift
//  Exchange Rates
//
//  Created by Dmitrii Diadiushkin on 15.05.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    private func configureRequest() -> URLRequest? {
        let urlComponents: URLComponents = {
            var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "mb1.as50464.net"
            urlComponents.port = 443
            urlComponents.path = "/moby-44/core"
            urlComponents.queryItems = [
                URLQueryItem(name: "r", value: "BEYkZbmV"),
                URLQueryItem(name: "d", value: "563B4852-6D4B-49D6-A86E-B273DD520FD2"),
                URLQueryItem(name: "t", value: "ExchangeRates"),
                URLQueryItem(name: "v", value: "44")
            ]
            return urlComponents
        }()
        
        guard let url = urlComponents.url else { return nil}
        
        let urlRequest: URLRequest = {
            var urlRequest = URLRequest(url: url)
            urlRequest.addValue("Test GeekBrains iOS 3.0.0.182 (iPhone 11; iOS 14.4.1; Scale/2.00; Private)", forHTTPHeaderField: "User-Agent")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            urlRequest.httpMethod = "POST"
            
            return urlRequest
        }()
        
        return urlRequest
    }
    
    func getRates(completion: ((Swift.Result<CurrencyRates, Error>) -> Void)? = nil) {
        guard let urlRequest = configureRequest() else { return }
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, responce, error) in
            guard let recivedData = data else {return}
            do {
                let json = try JSONDecoder().decode(CurrencyRates.self, from: recivedData)
                completion?(.success(json))
               // print(json)
            } catch {
                print(error.localizedDescription)
                completion?(.failure(error))
            }
        }
        
        task.resume()
    }
}
