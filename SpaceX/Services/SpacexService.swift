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

    private enum ApisConstant {
        static let baseUrl = "https://api.spacexdata.com/v4/"
        static let rocketEndpoint = "rockets"
        static let launchesEndpoint = "launches"
    }

    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    /// - Parameters: None
    /// - Returns: A list of most upcoming launches for the last 3 years
    func getUpcomingTrips(completion: @escaping (Result<[Launch], ServiceError>) -> Void) {
        let urlString = ApisConstant.baseUrl + ApisConstant.launchesEndpoint
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let launchList):
                do {
                    let model = try JSONDecoder().decode([Launch].self, from: launchList)
                    completion(.success(model))
                } catch {
                    completion(.failure(.cannotParse))
                }
            case .failure:
                completion(.failure(.cannotParse))
            }
        }
    }

    /// - Parameters: id: String (id of the rocket)
    /// - Returns: Get Rocket details for a launch
    func getRocketDetails(id: String, completion: @escaping (Result<Rocket, ServiceError>) -> Void) {
        let urlString = ApisConstant.baseUrl + ApisConstant.rocketEndpoint + "/\(id)"
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let rocketResult):
                do {
                    let model = try JSONDecoder().decode(Rocket.self, from: rocketResult)
                    completion(.success(model))
                } catch {
                    completion(.failure(.cannotParse))
                }
            case .failure:
                completion(.failure(.cannotParse))
            }
        }
    }
}
