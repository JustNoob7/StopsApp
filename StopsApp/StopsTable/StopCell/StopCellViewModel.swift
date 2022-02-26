//
//  StopCellViewModel.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 26.02.2022.
//

import Foundation

protocol StopCellViewModelProtocol {
    var stopName: String { get }
    var stopType: String { get }
    var transportImage: String { get }
    var transportImageColor: String { get }
    init(stop: Stop)
}

class StopCellViewModel: StopCellViewModelProtocol {
    
    var stopName: String {
        stop.name
    }
    
    var stopType: String {
        switch stop.type {
        case .public_transport:
            return "Автобусная остановка"
        case .train:
            return "Станция электропоезда"
        case .tram:
            return "Трамвайная остановка"
        case .mcd:
            return "Станция МЦД"
        case .subwayHall:
            return "Станция метро"
        }
    }
    
    var transportImage: String {
        "bus.fill"
    }
    
    var transportImageColor: String {
        switch stop.type {
        case .public_transport:
            return "systemBlue"
        case .train:
            return "systemBrown"
        case .tram:
            return "systemOrange"
        case .mcd:
            return "systemRed"
        case .subwayHall:
            return "systemTeal"
        }
    }
    
    private let stop: Stop
    
    required init(stop: Stop) {
        self.stop = stop
    }
}
