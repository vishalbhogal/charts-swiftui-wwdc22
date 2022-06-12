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
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
