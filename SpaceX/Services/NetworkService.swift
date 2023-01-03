//
//  NetworkService.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import Foundation

protocol NetworkService: AnyObject {

    var baseUrl: String { get set }

    // MARK: Get Upcoming Trips
    func getUpcomingTrips(completion: @escaping (Result<[Launch], ServiceError>) -> Void)
    
    // MARK: Get Rocket Details
    func getRocketDetails(id: String, completion: @escaping (Result<Rocket, ServiceError>) -> Void)
}
