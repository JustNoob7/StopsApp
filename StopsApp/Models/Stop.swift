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
    let type: StopTypes
    let routePath: [Transport]?
}

enum StopTypes: String, Decodable {
    case public_transport
    case train
    case tram
    case mcd
    case subwayHall
}

struct Transport: Decodable {
    let type: TransportTypes
    let number: String
    let timeArrival: [String]
    let lastStopName: String
}

enum TransportTypes: String, Decodable {
    case bus
    case tram
    case train
    case mcd
}
