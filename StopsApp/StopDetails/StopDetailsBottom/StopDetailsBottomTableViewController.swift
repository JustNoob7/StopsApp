//
//  StopDetailsBottomTableViewController.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 28.02.2022.
//

import UIKit

class StopDetailsBottomTableViewController: UITableViewController {
    
    var viewModel: StopDetailsBottomTableViewModelProtocol!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        tableView.register(UINib(nibName: StopDetailsBottomTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: StopDetailsBottomTableViewCell.identifier)
    }

}

// MARK: - Table view data source and delegate
extension StopDetailsBottomTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StopDetailsBottomTableViewCell.identifier, for: indexPath) as! StopDetailsBottomTableViewCell
        
        cell.viewModel = viewModel.cellViewModel(at: indexPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
