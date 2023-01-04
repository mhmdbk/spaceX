//
//  LaunchCollectionViewCell.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-04.
//

import UIKit

class LaunchCollectionViewCell: UICollectionViewCell, CellIdentifiable {

    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet weak var mainView: UIView!

    var viewModel: LaunchViewModel!

    func configure(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
        self.layer.cornerRadius = 45
        nameLabel.text = viewModel.displayName
        dateLabel.text = viewModel.dateText
        if let flightNumber = viewModel.flightNumber {
            numberLabel.text = "\(flightNumber)"
        }
        progressView.isHidden = !viewModel.isUpcoming
    }
}
