//
//  ContentView.swift
//  NearEarthObjectApp
//
//  Created by Najran Emarah on 18/07/1444 AH.
//

import SwiftUI
import Charts
struct ContentView: View {
    // showingAlert is a condition when alert should be shown
    @State private var showingAlert = false
  
    @State private var firstDate = Date(){
        didSet {
           let dayDiff = Calendar.current.dateComponents([.day], from: firstDate, to: lastDate).day!
            
            if dayDiff > 7 && dayDiff < 0{
                if let date = Calendar.current.date(byAdding: .day, value: 7, to: firstDate) {
                   // Use this date
                    lastDate = date
                }
            }
            }
    }
    @State private var lastDate = Date(){
        didSet {
           let dayDiff = Calendar.current.dateComponents([.day], from: firstDate, to: lastDate).day!
            
            if dayDiff > 7 && dayDiff < 0{
                if let date = Calendar.current.date(byAdding: .day, value: -7, to: lastDate) {
                   // Use this date
                    firstDate = date
                }
            }
            }
    }
    @StateObject var viewModel = ViewModel()
    var body: some View {
        ScrollView{
            VStack {
                
                HStack{
                    VStack{
                        Text("Pick start date")
                            .font(.headline)
                        DatePicker("", selection: $firstDate, displayedComponents: [.date])
                            .labelsHidden()
                        
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        
                            .font(Font.body.weight(.bold))
                        
                    }
                    VStack{
                        
                        Text("Pick end date")
                            .font(.headline)
                        
                        DatePicker("", selection: $lastDate, displayedComponents: [.date])
                            .labelsHidden()
                        
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                            .font(Font.body.weight(.bold))
                        
                    }
                }
                
                Button("Get Data") {
                    let dayDiff = Calendar.current.dateComponents([.day], from: firstDate, to: lastDate).day!
                    
                    if dayDiff > 7 || dayDiff < 0{
                        let date = Calendar.current.date(byAdding: .day, value: 7, to: firstDate)
                        // Use this date
                        lastDate = date!
                        showingAlert.toggle()
                    }
                    else{
                        
                        let formatter = DateFormatter()
                        formatter.dateFormat = "YYYY-MM-dd"
                        
                        let startDate = formatter.string(from: firstDate)
                        let endDate = formatter.string(from: lastDate)
                        viewModel.fetchData(sDate: startDate, eData: endDate)
                        
                    }
                    
                }
                
                .buttonStyle(.borderedProminent)
                .disabled(firstDate.compare(lastDate) == .orderedAscending ? false : true)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Wrong Dates"), message: Text("There should be maximum 7 days difference between dates. Start date should be less than End date"), dismissButton: .default(Text("OK")))
                }
                
                if viewModel.isAnimating{
                    ProgressView()
                }
                
                HStack{
                   
                    VStack{
                        Spacer()
                            .frame(height: 50)
                        VStack{
                            Text("Fastest Asteroid ID")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                            Text(viewModel.fastedAsteroidIDSpeed?.0 ?? " ")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        }
                        .border(.gray)
                    }
                    
                    
                    VStack{
                        Spacer()
                            .frame(height: 50)
                        VStack{
                        Text("Asteroid Speed(km/hr)")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        Text(viewModel.fastedAsteroidIDSpeed?.1 ?? " ")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        }
                        .border(.gray)
                    }
                }
                
                Spacer()
                    .frame(height: 50)
                HStack{
                    VStack{
                        Text("Closest Asteroid ID")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        Text(viewModel.closestAsteroidIDDistence?.0 ?? " ")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                    }
                    .border(.gray)
                    Spacer()
                        .frame(height: 50)
                    VStack{
                        Text("Distence From Earth(km)")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        Text(viewModel.closestAsteroidIDDistence?.1 ?? " ")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                    }
                    .border(.gray)
                }
                Spacer()
                    .frame(height: 50)
                HStack{
                    Text("Average Size( in km)")
                        .font(.headline)
                    
                    Spacer()
                    Text(viewModel.averageSize ?? " ")
                        .font(.headline)
                }
                
                Spacer()
                    .frame(height: 50)
                GroupBox("Asteroids Datewise Line Chart"){
                    
                    Chart{
                        ForEach(viewModel.lineChartArray!){
                            
                            LineMark(x: .value("Day",$0.date,unit: .day ), y: .value("Asteroids Count", $0.asteroidCount))
                        }
                    }
                }
                .font(.headline)
                
            }
            .padding()
            .onAppear(){
                if let date = Calendar.current.date(byAdding: .day, value: -7, to: Date()) {
                    // Use this date
                    firstDate = date
                }
            }
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
