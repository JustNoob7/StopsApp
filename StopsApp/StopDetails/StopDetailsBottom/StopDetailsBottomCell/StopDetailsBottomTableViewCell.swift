//
//  StopDetailsBottomTableViewCell.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 28.02.2022.
//

import UIKit

class StopDetailsBottomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var lastStopLabel: UILabel!
    
    @IBOutlet weak var transportImageView: UIImageView!
    
    static let identifier = "StopDetailsBottomTableViewCell"
    
    var viewModel: StopDetailsBottomCellViewModelProtocol! {
        didSet {
            numberLabel.text = viewModel.number
            timeLabel.text = viewModel.time
            lastStopLabel.text = viewModel.lastStop
            transportImageView.image = UIImage(systemName: viewModel.transportImage)
            transportImageView.tintColor = UIColor(named: viewModel.transportImageColor)
        }
    }

}
