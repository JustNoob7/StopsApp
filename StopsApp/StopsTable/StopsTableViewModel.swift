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
    func fetchStop(at indexPath: IndexPath, completion: @escaping(_ error: Error?) -> Void)
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
        NetworkManager.shared.fetch(dataType: StopsInfo.self, from: url) { [unowned self] result in
            switch result {
            case .success(let stopsInfo):
                self.stops = stopsInfo.data
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func cellViewModel(at indexPath: IndexPath) -> StopCellViewModelProtocol {
        StopCellViewModel(stop: stops[indexPath.row])
    }
    
    func fetchStop(at indexPath: IndexPath, completion: @escaping(_ error: Error?) -> Void) {
        let url = url + "/" + stops[indexPath.row].id
        
        NetworkManager.shared.fetch(dataType: Stop.self, from: url) { [weak self] result in
            switch result {
            case .success(let stop):
                self?.stop = stop
                completion(nil)
            case .failure(let error):
                print(error)
                completion(error)
            }
        }
    }
    
    func detailsViewModel(at indexPath: IndexPath) -> StopDetailsViewModelProtocol {
        if let stop = stop {
            return StopDetailsViewModel(stop: stop)
        }
        return StopDetailsViewModel(stop: stops[indexPath.row])
    }
}
