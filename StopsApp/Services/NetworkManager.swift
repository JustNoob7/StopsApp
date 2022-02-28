//
//  NetworkManager.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 26.02.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchStops(from url: String, with completion: @escaping(Result<[Stop], NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let stopsInfo = try JSONDecoder().decode(StopsInfo.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(stopsInfo.data))
                }
            } catch {
                completion(.failure(.decodingError))
            }

        }.resume()
    }
    
    func fetchStop(from url: String, with completion: @escaping(Result<Stop, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }

            do {
                let stop = try JSONDecoder().decode(Stop.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(stop))
                }
            } catch {
                completion(.failure(.decodingError))
            }

        }.resume()
    }
}
