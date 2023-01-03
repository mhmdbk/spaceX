//
//  LaunchListViewController.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import UIKit

class LaunchListViewController: UIViewController, Presentable, StoryboardLoadable {

    var viewModel: LaunchListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        assert(viewModel != nil, "ViewModel cannot be nil")
        fetchTrips()
    }
}

// MARK: - Private helper methods
private extension LaunchListViewController {

    func configureViews() {
    }

    func fetchTrips() {
        showHUD()
        viewModel.fetchTrips { [weak self] success, error in
            guard let self = self else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.hideHUD()
                guard success else {
                    print("error while fetching trips: \(error.debugDescription)")
                    return
                }
                print("the fetched trips are: \(self.viewModel.launchList)")
                // reload collectionviewData
            }
        }
    }
}
