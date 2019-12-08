//
//  StocksData.swift
//  PeopleAndAppleStockPrices
//
//  Created by Gregory Keeley on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


struct StockInfo: Codable {
    let date: String
    let close: Double
    let open: Double
    let label: String
    let changeOverTime: Double
    let changePercent: Double
}

extension StockInfo {
    static func getStocks() -> [StockInfo] {
        var stocks = [StockInfo]()
        guard let fileURL = Bundle.main.url(forResource: "applstockinfo", withExtension: "json") else {
            fatalError("Could not locate applestocksinfo.json")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let stockData = try JSONDecoder().decode([StockInfo].self, from: data)
            stocks = stockData
            
        } catch {
            fatalError("Failed to load contents: \(error)")
        }
        return stocks
    }
}
