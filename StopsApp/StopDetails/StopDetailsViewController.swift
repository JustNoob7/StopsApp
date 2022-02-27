//
//  StopDetailsViewController.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 26.02.2022.
//

import UIKit

class StopDetailsViewController: UIViewController {
    
    @IBOutlet private weak var someLabel: UILabel!
    
    var viewModel: StopDetailsViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = viewModel.name
        someLabel.text = viewModel.routePath.first?.number
    }

}
