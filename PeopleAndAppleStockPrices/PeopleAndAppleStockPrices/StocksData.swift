//
//  StocksData.swift
//  PeopleAndAppleStockPrices
//
//  Created by Gregory Keeley on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Stocks {
    let date: String
    let open: Double
    let label: String
    let changeOverTime: Double
    
}

extension Stocks {
    static func getStocks() -> [Stocks] {
        var stocks = [Stocks]()
        guard let fileURL = Bundle.main.url(forResource: "applestockinfo", withExtension: "json") else {
            fatalError("Could not locate applestocksinfo.json")
        }
        do {
            let data = try Data(contentsOf: fileURL)
        }
    }
}
