//
//  StopTableViewCell.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 26.02.2022.
//

import UIKit

class StopTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var transportImageView: UIImageView!
    
    var viewModel: StopCellViewModelProtocol! {
        didSet {
            nameLabel.text = viewModel.stopName
            typeLabel.text = viewModel.stopType
            transportImageView.image = UIImage(systemName: viewModel.transportImage)
            transportImageView.backgroundColor = UIColor(named: viewModel.transportImageColor)
        }
    }
}
