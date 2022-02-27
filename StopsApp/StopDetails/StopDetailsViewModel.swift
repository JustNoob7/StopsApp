//
//  StopDetailsViewModel.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 26.02.2022.
//

import Foundation

protocol StopDetailsViewModelProtocol {
    var name: String { get }
    var lon: Double { get }
    var lat: Double { get }
    init(stop: Stop)
}

class StopDetailsViewModel: StopDetailsViewModelProtocol {
    
    var name: String {
        stop.name
    }
    
    var lon: Double {
        stop.lon
    }
    
    var lat: Double {
        stop.lat
    }
    
    private var stop: Stop
    
    required init(stop: Stop) {
        self.stop = stop
    }
}
