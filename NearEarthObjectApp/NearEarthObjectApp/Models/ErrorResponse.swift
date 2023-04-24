//
//  ErrorResponse.swift
//  NearEarthObjectApp
//
//  Created by Najran Emarah on 18/07/1444 AH.
//

import Foundation
struct ErrorInfo: Codable {
    let code: String?
    let message: String?
}
struct ErrorResponse: Codable {
    let error: ErrorInfo
}

extension ErrorResponse: LocalizedError {
    var errorDescription: String? {
        return error.message ?? ""
    }
}
