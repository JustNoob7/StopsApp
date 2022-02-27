//
//  StopsTableViewModel.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 26.02.2022.
//

import Foundation

protocol StopsTableViewModelProtocol {
    var numberOfRows: Int { get }
    func fetchStops(completion: @escaping() -> Void)
    func cellViewModel(at indexPath: IndexPath) -> StopCellViewModelProtocol
    func detailsViewModel(at indexPath: IndexPath) -> StopDetailsViewModelProtocol
}

class StopsTableViewModel: StopsTableViewModelProtocol {
    
    var numberOfRows: Int {
        stops.count
    }
    
    private let url = "https://api.mosgorpass.ru/v8.2/stop"
    
    private var stops: [Stop] = []
    
    private var stop: Stop?
        
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
    
    func detailsViewModel(at indexPath: IndexPath) -> StopDetailsViewModelProtocol {
        fetchStop(with: indexPath)
        if let stop = stop {
            print("11")
            return StopDetailsViewModel(stop: stop)
        }
        return StopDetailsViewModel(stop: stops[indexPath.row])
    }
    
    private func fetchStop(with indexPath: IndexPath) {
        let url = url + "/" + stops[indexPath.row].id
        
        NetworkManager.shared.fetchStop(from: url) { result in
            switch result {
            case .success(let stop):
                self.stop = stop
            case .failure(let error):
                print(error)
            }
        }
    }
}
