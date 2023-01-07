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
    @IBOutlet private weak var launchImageView: UIImageView!
    
    var viewModel: LaunchViewModel!

    func configure(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.displayName
        dateLabel.text = viewModel.dateText
        if let flightNumber = viewModel.flightNumber {
            numberLabel.text = "\(flightNumber)"
        }
        if let url = viewModel.imageUrl {
            launchImageView.kf.setImage(with: url)
        }
        progressView.isHidden = !viewModel.isUpcoming
    }
}
