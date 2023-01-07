//
//  LaunchViewModel.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-04.
//

import Foundation

class LaunchViewModel {

    let launch: Launch

    init(launch: Launch) {
        self.launch = launch
    }

    var displayName: String {
        return launch.name ?? ""
    }

    var detailsText: String {
        return launch.details ?? ""
    }

    var flightNumber: Int? {
        return launch.flightNumber
    }

    var dateText: String {
        guard let utcDate = launch.date, let date = utcDate.toDate() else {
            return ""
        }
        return date.getPortolioCreatedDate()
    }

    var isUpcoming: Bool {
        return launch.upcoming ?? false
    }

    var imageUrl: URL? {
        guard let imageUrlString = launch.images?.patch?.small,
              let url = URL(string: imageUrlString) else {
            return nil
        }
        return url
    }
}
