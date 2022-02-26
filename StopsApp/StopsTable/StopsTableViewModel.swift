//
//  StopsTableViewModel.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 26.02.2022.
//

import Foundation

protocol StopsTableViewModelProtocol {
    var stops: [Stop] { get }
    var numberOfRows: Int { get }
    func fetchStops(completion: @escaping() -> Void)
    func cellViewModel(at indexPath: IndexPath) -> StopCellViewModelProtocol
}

class StopsTableViewModel: StopsTableViewModelProtocol {
    
    var stops: [Stop] = []
    
    var numberOfRows: Int {
        stops.count
    }
    
    private let url = "https://api.mosgorpass.ru/v8.2/stop"
    
    func fetchStops(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchStops(from: url) { [unowned self] result in
            switch result {
            case .success(let stops):
                self.stops = stops
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func cellViewModel(at indexPath: IndexPath) -> StopCellViewModelProtocol {
        StopCellViewModel(stop: stops[indexPath.row])
    }
}
