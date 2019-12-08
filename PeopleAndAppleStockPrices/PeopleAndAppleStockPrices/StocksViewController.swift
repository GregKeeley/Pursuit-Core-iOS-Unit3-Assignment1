//
//  ViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Alex Paul on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var stocks = [StockInfo]()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
loadData()
  }
    
    func loadData() {
        stocks = StockInfo.getStocks()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let stockDetailVC = segue.destination as? StocksDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("failed to properly prepare for segue")
        }
        let stock = stocks[indexPath.row]
        stockDetailVC.stock = stock
    }
}

extension StocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stocks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        let stockInfo = stocks[indexPath.row]
        cell.textLabel?.text = stockInfo.date
        cell.detailTextLabel?.text = stockInfo.open.description
        return cell
    }
}
