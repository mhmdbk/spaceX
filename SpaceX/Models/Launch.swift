//
//  Launch.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import Foundation

struct Launch: Decodable {
    let name: String?
    let details: String?
    let upcoming: Bool?
    let success: Bool?
    let rocket: String?
    let date: String?
    let flightNumber: Int?
    let images: Links?

    enum CodingKeys: String, CodingKey {
        case name
        case details
        case upcoming
        case rocket
        case success
        case date = "date_utc"
        case flightNumber = "flight_number"
        case images = "links"
    }
}
