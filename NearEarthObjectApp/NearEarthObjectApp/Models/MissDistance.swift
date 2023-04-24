//
//  MissDistance.swift
//  NearEarthObjectApp
//
//  Created by Najran Emarah on 18/07/1444 AH.
//

import Foundation
struct MissDistance: Codable {
    let astronomical: String
    let lunar: String
    let kilometers: String
    let miles: String
    
    func toString() -> String {
        return String(format: "%.2f kilometers", Double(kilometers)!)
    }
}
