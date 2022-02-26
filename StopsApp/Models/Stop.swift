//
//  Stop.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 26.02.2022.
//

import Foundation

struct StopsInfo: Decodable {
    let data: [Stop]
}

struct Stop: Decodable {
    let id: String
    let lat: Double
    let lon: Double
    let name: String
    let type: TransportTypes
    let routePath: [Transport]?
}

enum TransportTypes: String, Decodable {
    case public_transport
    case train
    case tram
    case mcd
    case subwayHall
}

struct Transport: Decodable {
    let type: String
    let number: String
    let timeArrival: [String]
    let lastStopName: String
}
