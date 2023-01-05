//
//  RocketDetailsViewController.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import UIKit
import Kingfisher
import SafariServices

class RocketDetailsViewController: UIViewController, Presentable, StoryboardLoadable {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var readMoreButton: UIButton!
    @IBOutlet private weak var rocketImageView: UIImageView!
    @IBOutlet private weak var detailsView: UIView!

    var viewModel: RocketDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRocket()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - Private Helper Methods
private extension RocketDetailsViewController {
    func configureViews() {
        detailsView.layer.cornerRadius = 25
        detailsView.clipsToBounds = true
        detailsView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        if let number = viewModel.launch.flightNumber {
            numberLabel.text = "\(number)"
        }
        dateLabel.text = viewModel.dateText
        if let url = viewModel.imageUrl {
            rocketImageView.kf.setImage(with: url)
        }
    }

    func fetchRocket() {
        showHUD()
        viewModel.fetchRocket { [weak self] success, error in
            guard let self = self else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.hideHUD()
                guard success else {
                    print("error while fetching trips: \(error.debugDescription)")
                    return
                }
                self.configureViews()
            }
        }
    }

    func showSafariVC(url: URL, completion: (() -> Void)? = nil) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: completion)
        return safariVC
    }
}

// MARK: - IBActions
extension RocketDetailsViewController {

    @IBAction func readMoreButtonTapped(_ sender: Any) {
        if let url = viewModel.wikepediaUrl {
            _ = showSafariVC(url: url)
        }
    }

    @IBAction func closeButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
