//
//  EstimatedDiameter.swift
//  NearEarthObjectApp
//
//  Created by Najran Emarah on 18/07/1444 AH.
//

import Foundation
struct EstimatedDiameter: Codable {
    let kilometers: Diameter
    
    func toString() -> String {
        return "[\(kilometers.toString())]" + " kilometers"
    }
}
