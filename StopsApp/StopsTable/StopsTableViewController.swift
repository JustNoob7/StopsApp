//
//  StopsTableViewController.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 26.02.2022.
//

import UIKit

class StopsTableViewController: UITableViewController {
    
    private var viewModel: StopsTableViewModelProtocol! {
        didSet {
            viewModel.fetchStops {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = StopsTableViewModel()
    }

// MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stop", for: indexPath) as! StopTableViewCell
       
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        
        return cell
    }
}
