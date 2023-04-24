//
//  Diameter.swift
//  NearEarthObjectApp
//
//  Created by Najran Emarah on 18/07/1444 AH.
//

import Foundation
struct Diameter: Codable {
    let minEstimatedDiameter: Double
    let maxEstimatedDiameter: Double
    
    enum CodingKeys: String, CodingKey {
        case minEstimatedDiameter = "estimated_diameter_min"
        case maxEstimatedDiameter = "estimated_diameter_max"
    }
    
    func toString() -> String {
        return String(format: "Min: %.2f - Max: %.2f", minEstimatedDiameter, maxEstimatedDiameter)
    }
    func averageDiameter()->Double{
        return (minEstimatedDiameter+maxEstimatedDiameter)/2
    }
}
