//
//  LineChartModel.swift
//  NearEarthObjectApp
//
//  Created by Najran Emarah on 18/07/1444 AH.
//

import Foundation
struct LineChartModel: Identifiable {
    let id = UUID()
   let date: Date
    let asteroidCount: Int

    init(day: String, count: Int) {
        let formatter = DateFormatter()
         formatter.dateFormat = "YYYY-MM-dd"
         
        self.date = formatter.date(from: day) ?? Date.distantPast
     
      asteroidCount = count
   }
}
