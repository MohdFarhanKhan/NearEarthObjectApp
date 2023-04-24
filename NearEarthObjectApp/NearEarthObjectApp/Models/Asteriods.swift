//
//  Asteriods.swift
//  NearEarthObjectApp
//
//  Created by Najran Emarah on 18/07/1444 AH.
//

import Foundation
struct Asteriods: Codable {
    let links: Links
    let elementCount: Int
    let nearEarthObjects: [String: [Asteriod]]
    
    enum CodingKeys: String, CodingKey {
        case links
        case elementCount = "element_count"
        case nearEarthObjects = "near_earth_objects"
    }
    func calculateFastestAstroid()->(String, String){
        var fastedAstroidId : String = ""
        var speedAsteroid : String = ""
        
        for (_,asteroids) in nearEarthObjects{
            for astr in asteroids{
                fastedAstroidId = astr.id
                
                for closeApproachItem in astr.closeApproachData{
                    speedAsteroid = getGreaterValue(firstValue: speedAsteroid, secondValue: closeApproachItem.relativeVelocity.kmPerHour)
                    
                }
            }
        }
        let speedAsteroidInDouble : Double = Double(speedAsteroid) ?? 0
        speedAsteroid = String(format: " %.2f", speedAsteroidInDouble)
       
        return (fastedAstroidId,speedAsteroid)
    }
    func getGreaterValue(firstValue: String, secondValue:String)->String{
        
        let v1 : Double = Double(firstValue) ?? 0
        let v2 : Double = Double(secondValue) ?? 0
        
        if v1 > v2{
            return firstValue
        }
        else{
            return secondValue
        }
    }
    func getMinimumValue(firstValue: String, secondValue:String)->String{
        
        let v1 : Double = Double(firstValue) ?? 0
        let v2 : Double = Double(secondValue) ?? 0
        
        if v1 > v2{
            return secondValue
        }
        else{
            return firstValue
        }
    }
    func calculateClosestAstroid()->(String, String){
        
        var closesAstroidId : String = ""
        var distenceFromEarth : String = ""
        for (_,asteroids) in nearEarthObjects{
            for astr in asteroids{
                closesAstroidId = astr.id
                for closeApproachItem in astr.closeApproachData{
                    distenceFromEarth = closeApproachItem.missDistance.kilometers
                    break
                }
                break
            }
            break
        }
        for (_,asteroids) in nearEarthObjects{
            for astr in asteroids{
                closesAstroidId = astr.id
                for closeApproachItem in astr.closeApproachData{
                    distenceFromEarth = getMinimumValue(firstValue: distenceFromEarth, secondValue:closeApproachItem.missDistance.kilometers)
                    
                }
            }
        }
        let distenceFromEarthInDouble : Double = Double(distenceFromEarth) ?? 0
       
        distenceFromEarth = String(format: " %.2f", distenceFromEarthInDouble)
        return (closesAstroidId,distenceFromEarth)
    }
    func calculateAverageSizeOfAstroid()->String{
        var averageSize:Double = 0
        var i = 0
        for (_,asteroids) in nearEarthObjects{
            for astr in asteroids{
                i += 1
                averageSize += astr.estimatedDiameter.kilometers.averageDiameter()
                
            }
        }
        
        return String(format: "%.2f km", averageSize/Double(i))
    }
}
/*
 Fastest Asteroid in km/h (Respective Asteroid ID & its speed)
 Closest Asteroid (Respective Asteroid ID & its distance)
 Average Size of the Asteroids in kilometers

 */
