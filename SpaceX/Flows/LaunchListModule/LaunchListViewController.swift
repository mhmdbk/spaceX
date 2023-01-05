//
//  LaunchListViewController.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import UIKit

class LaunchListViewController: UIViewController, Presentable, StoryboardLoadable {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var goldButton: UIButton!
    
    var viewModel: LaunchListViewModel!

    var onLaunchItemTapped: ((Launch) -> Void)?

    private let cellWidth: CGFloat = 190
    private let cellHeight: CGFloat = 200

    override func viewDidLoad() {
        super.viewDidLoad()
        assert(viewModel != nil, "ViewModel cannot be nil")
        configureViews()
        fetchTrips()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

// MARK: - Private helper methods
private extension LaunchListViewController {

    func configureViews() {
        collectionViewSetup()
        let bellImage = UIImage(named: "bell-icon")
        let searchImage = UIImage(named: "search-icon")
        let bellButton   = UIBarButtonItem(image: bellImage, style: .plain, target: self, action: #selector(didTapBellButton(sender:)))
        let searchButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(didTapSearchButton(sender:)))
        navigationItem.rightBarButtonItems = [bellButton, searchButton]
        
        let titleLabel = UILabel()
        titleLabel.text = "Launches"
        titleLabel.applyStyle(textColor: .black, font: Fonts.font(name: .font800, size: 24))
        let titlebarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItems = [titlebarButtonItem]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    func collectionViewSetup() {
        let cellNib = UINib(nibName: LaunchCollectionViewCell.cellNibName, bundle: nil)
        collectionView
            .register(cellNib,
                      forCellWithReuseIdentifier: LaunchCollectionViewCell.cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
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
                self.collectionView.reloadData()
            }
        }
    }

    @objc func didTapBellButton(sender: AnyObject) {
    }
    @objc func didTapSearchButton(sender: AnyObject) {
    }
}

// MARK: - UICollectionViewDataSource
extension LaunchListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.nbOfLaunches
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: LaunchCollectionViewCell.cellIdentifier,
                                               for: indexPath) as? LaunchCollectionViewCell {
            cell.configure(viewModel: viewModel.launchCellModel(at: indexPath))
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate
extension LaunchListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentLaunch = viewModel.launchList[indexPath.item]
        onLaunchItemTapped?(currentLaunch)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension LaunchListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
