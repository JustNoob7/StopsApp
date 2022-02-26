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
        tableView.rowHeight = 80
        title = viewModel.stops.first?.name
    }

// MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stop", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = viewModel.getName(indexPath: indexPath)
        content.secondaryText = viewModel.getType(indexPath: indexPath)
        
        cell.contentConfiguration = content
        return cell
    }
}
