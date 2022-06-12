//
//  ContentView.swift
//  charts-swift-ui-wwdc22
//
//  Created by Vishal Bhogal on 07/06/22.
//

import SwiftUI
import Charts

struct FoodCourtShops: Identifiable {
    var shopName: String
    var color: String
    var sales: Int
    var id: String { shopName }
}

let foodCourtShops: [FoodCourtShops] = {
    [.init(shopName: "Turmeric", color: "Green", sales: 5),
     .init(shopName: "Biryani Hub", color: "Red", sales: 4),
     .init(shopName: "No Nonsense Tea", color: "Pink", sales: 8),
     .init(shopName: "De Thali", color: "Blue", sales: 3),
     .init(shopName: "Food Dozers", color: "Yellow", sales: 7),
    ]
}()

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Chart(foodCourtShops) {
                        BarMark(x: .value("Name", $0.shopName),
                                y: .value("Sales", $0.sales))
                        .foregroundStyle(by: .value("ColorId", $0.color))
                        .opacity(0.85)
                        .symbol(by: .value("chartSymbol", $0.color))
                        .cornerRadius(12)
                    }
                    .chartForegroundStyleScale([
                        "Green": .green,
                        "Red": .red,
                        "Pink": .pink,
                        "Yellow": .yellow,
                        "Blue": .blue
                    ])
                    .frame(height: 400)
                    .padding()
                    
                    Chart(foodCourtShops) {
                        LineMark(x: .value("Name", $0.shopName),
                                y: .value("Sales", $0.sales))
                        .opacity(0.85)
                        .cornerRadius(12)
                        .foregroundStyle(Color.orange.gradient)
                    }
                    .frame(height: 400)
                    .padding()
                    
                    Chart(foodCourtShops) {
                        PointMark(x: .value("Name", $0.shopName),
                                y: .value("Sales", $0.sales))
                        .foregroundStyle(by: .value("ColorId", $0.color))
                        .opacity(0.85)
                        .symbol(by: .value("chartSymbol", $0.color))
                        .cornerRadius(12)
                    }
                    .chartForegroundStyleScale([
                        "Green": .green,
                        "Red": .red,
                        "Pink": .pink,
                        "Yellow": .yellow,
                        "Blue": .blue
                    ])
                    .frame(height: 400)
                    .padding()
                    
                    Chart(foodCourtShops) {
                        AreaMark(x: .value("Name", $0.shopName),
                                y: .value("Sales", $0.sales))
                        .opacity(0.85)
                        .symbol(by: .value("chartSymbol", $0.color))
                        .cornerRadius(12)
                        .foregroundStyle(Color.yellow.gradient)
                    }
                    .chartForegroundStyleScale([
                        "Green": .green,
                        "Red": .red,
                        "Pink": .pink,
                        "Yellow": .yellow,
                        "Blue": .blue
                    ])
                    .frame(height: 400)
                    .padding()
                }
                .navigationTitle("Charts")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
