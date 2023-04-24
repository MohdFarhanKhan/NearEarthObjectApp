//
//  RelativeVelocity.swift
//  NearEarthObjectApp
//
//  Created by Najran Emarah on 18/07/1444 AH.
//

import Foundation

struct RelativeVelocity: Codable {
    let kmPerSecond: String
    let kmPerHour: String
    let milesPerHour: String

    enum CodingKeys: String, CodingKey {
        case kmPerSecond = "kilometers_per_second"
        case kmPerHour = "kilometers_per_hour"
        case milesPerHour = "miles_per_hour"
    }

    func toString() -> String {
        return String(format: "%.2f kilometers/hour", Double(kmPerHour)!)
    }
}
