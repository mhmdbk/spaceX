//
//  SpacexService.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import Foundation
import Alamofire

enum ServiceError: Error {
    case cannotParse
}

/// A service that knows how to perform requests for GitHub data.
class SpacexService: NetworkService {

    var baseUrl = "https://api.spacexdata.com/v4/"

    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

}
