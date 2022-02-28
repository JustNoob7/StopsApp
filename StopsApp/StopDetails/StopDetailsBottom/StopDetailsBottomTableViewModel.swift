//
//  StopDetailsBottomTableViewModel.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 28.02.2022.
//

import Foundation

protocol StopDetailsBottomTableViewModelProtocol {
    var numberOfRows: Int { get }
    init(stop: Stop)
    func cellViewModel(at indexPath: IndexPath) -> StopDetailsBottomCellViewModelProtocol
}

class StopDetailsBottomTableViewModel: StopDetailsBottomTableViewModelProtocol {
    
    var numberOfRows: Int {
        stop.routePath?.count ?? 0
    }
    
    private var stop: Stop
    
    required init(stop: Stop) {
        self.stop = stop
    }
    
    func cellViewModel(at indexPath: IndexPath) -> StopDetailsBottomCellViewModelProtocol {
        StopDetailsBottomCellViewModel(transport: stop.routePath?[indexPath.row] ?? Transport(type: "", number: "", timeArrival: [""], lastStopName: ""))
    }
}
