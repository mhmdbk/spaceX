//
//  Rocket.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import Foundation

import Foundation

struct Rocket: Decodable {
    let id: String?
    let name: String?
    let description: String?
    let wikipedia: String?
    let images: [String]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case wikipedia
        case images = "flickr_images"
    }
}
