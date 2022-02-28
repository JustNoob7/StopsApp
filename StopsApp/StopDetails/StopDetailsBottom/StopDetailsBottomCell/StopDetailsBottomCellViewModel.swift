//
//  StopDetailsBottomCellViewModel.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 28.02.2022.
//

import Foundation

protocol StopDetailsBottomCellViewModelProtocol {
    var number: String { get }
    var time: String { get }
    var lastStop: String { get }
    var transportImage: String { get }
    var transportImageColor: String { get }
    init(transport: Transport)
}

class StopDetailsBottomCellViewModel: StopDetailsBottomCellViewModelProtocol {
    
    var number: String {
        "№\(transport.number)"
    }
    
    var time: String {
        if transport.timeArrival.count == 1 {
            return transport.timeArrival.joined(separator: "")
        } else {
            return transport.timeArrival.joined(separator: ", ")
        }
    }
    
    var lastStop: String {
        transport.lastStopName
    }
    
    var transportImage: String {
        "bus.fill"
    }
    
    var transportImageColor: String {
        switch transport.type {
        case .bus:
            return "systemBlue"
        case .tram:
            return "systemOrange"
        case .train:
            return "systemBrown"
        case .mcd:
            return "systemRed"
        }
    }
    
    private var transport: Transport
    
    required init(transport: Transport) {
        self.transport = transport
    }
    
}
