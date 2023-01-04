//
//  RocketDetailsViewModel.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import Foundation

class RocketDetailsViewModel {

    typealias Dependencies = HasNetworkService

    private let dependencies: Dependencies

    let launch: Launch
    var rocket: Rocket?

    init(dependencies: Dependencies, launch: Launch) {
        self.dependencies = dependencies
        self.launch = launch
    }

    var name: String {
        return rocket?.name ?? ""
    }

    var description: String {
        return rocket?.description ?? ""
    }

    var imageUrl: URL? {
        guard let imageUrlString = rocket?.images?.first,
              let url = URL(string: imageUrlString) else {
            return nil
        }
        return url
    }

    var wikepediaUrl: URL? {
        guard let wikepediaUrlString = rocket?.wikipedia,
              let url = URL(string: wikepediaUrlString) else {
            return nil
        }
        return url
    }

    var dateText: String {
        guard let utcDate = launch.date, let date = utcDate.toDate() else {
            return ""
        }
        return date.getPortolioCreatedDate()
    }
}

// MARK: - Network calls
extension RocketDetailsViewModel {
    func fetchRocket(completion: @escaping ((Bool, Error?) -> Void)) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            self.dependencies.networkService.getRocketDetails(id: self.launch.rocket ?? "") { result in
                switch result {
                case .success(let rocket):
                    self.rocket = rocket
                    completion(true, nil)
                case .failure(let error):
                    print(error)
                    completion(false, error)
                }
            }
        }
    }
}
