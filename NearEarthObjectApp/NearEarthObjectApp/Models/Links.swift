//
//  Links.swift
//  NearEarthObjectApp
//
//  Created by Najran Emarah on 18/07/1444 AH.
//

import Foundation
struct Links: Codable {
    let prev: String?
    let next: String?
    let current: String
    
    enum CodingKeys: String, CodingKey {
        case prev
        case next
        case current = "self"
    }
}
