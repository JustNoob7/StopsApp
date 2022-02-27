//
//  StopDetailsViewModel.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 26.02.2022.
//

import Foundation

protocol StopDetailsViewModelProtocol {
    var name: String { get }
    var lon: String { get }
    var routePath: [Transport] { get }
    init(stop: Stop)
}

class StopDetailsViewModel: StopDetailsViewModelProtocol {
    
    var name: String {
        stop.name
    }
    
    var lon: String {
        "\(stop.lat) \(stop.lon)"
    }
    
    var routePath: [Transport] {
        stop.routePath ?? [Transport(type: "", number: "0", timeArrival: [""], lastStopName: "")]
    }
    
    private var stop: Stop
    
    required init(stop: Stop) {
        self.stop = stop
    }
}
