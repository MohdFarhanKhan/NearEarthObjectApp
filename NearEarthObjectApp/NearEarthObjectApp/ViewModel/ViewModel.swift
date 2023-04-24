//
//  ViewModel.swift
//  NearEarthObjectApp
//
//  Created by Najran Emarah on 18/07/1444 AH.
//

import Foundation

import SwiftUI


class ViewModel:ObservableObject{
    @Published  var isAnimating = false
    @Published var asteriods: Asteriods? = nil
    @Published var fastedAsteroidIDSpeed: (String,String)? = nil
    @Published var closestAsteroidIDDistence: (String,String)? = nil
    @Published var averageSize: String? = ""
    @Published var lineChartArray: [LineChartModel]? = []
    func fetchData(sDate: String, eData: String){
       isAnimating = true
        NasaPIClient.getAsteriodFeed(startDate: sDate, endData: eData) { [self] asteriods in
            self.asteriods = asteriods
            self.fastedAsteroidIDSpeed = self.asteriods?.calculateFastestAstroid()
            self.closestAsteroidIDDistence = self.asteriods?.calculateClosestAstroid()
            self.averageSize = self.asteriods?.calculateAverageSizeOfAstroid()
            for (key,astrds) in asteriods.nearEarthObjects{
                let lineChartModel = LineChartModel.init(day: key, count: astrds.count)
               
                self.lineChartArray?.append(lineChartModel)
            }
            self.isAnimating = false
        } errorHandler: { error in
            self.isAnimating = false
        }
      }
}
