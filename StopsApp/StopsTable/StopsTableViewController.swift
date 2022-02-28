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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as! StopDetailsViewController
        detailsVC.viewModel = sender as? StopDetailsViewModelProtocol
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Упс!", message: "К сожалению, данные временно отсутствуют, приносим извинения.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Table view data source and delegate
extension StopsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stop", for: indexPath) as! StopTableViewCell
       
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.fetchStop(at: indexPath) { [unowned self] error in
            if error != nil {
                self.showAlert()
            } else {
                let detailsViewModel = self.viewModel.detailsViewModel(at: indexPath)
                self.performSegue(withIdentifier: "showDetailsVC", sender: detailsViewModel)
            }
        }
    }
}
