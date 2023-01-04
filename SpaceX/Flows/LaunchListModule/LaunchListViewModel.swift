//
//  LaunchListViewModel.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import Foundation

class LaunchListViewModel {

    typealias Dependencies = HasNetworkService

    private let dependencies: Dependencies

    var launchList = [Launch]()

    var nbOfLaunches: Int {
        return launchList.count
    }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - Network calls
extension LaunchListViewModel {
    func fetchTrips(completion: @escaping ((Bool, Error?) -> Void)) {
        DispatchQueue.global(qos: .background).async {
            self.dependencies.networkService.getUpcomingTrips { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let launchList):
                    self.launchList = launchList
                    self.filterLaunchList()
                    completion(true, nil)
                case .failure(let error):
                    print(error)
                    completion(false, error)
                }
            }
        }
    }
}

// MARK: - Helper Methods
extension LaunchListViewModel {
    private func filterLaunchList() {
        launchList = launchList
            .filter{ $0.success == true || $0.upcoming == true }
            .filter {
                guard let tripDate = $0.date?.toDate() else { return false }
                return tripDate.checkIfDateInRange(years: 3)
            }
    }

    func launchCellModel(at index: IndexPath) -> LaunchViewModel {
        let item = launchList[index.row]
        return LaunchViewModel(launch: item)
    }
}
