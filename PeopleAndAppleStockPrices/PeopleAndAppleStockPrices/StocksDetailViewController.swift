//
//  StocksDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Gregory Keeley on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksDetailViewController: UIViewController {

    @IBOutlet weak var changeImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    
    var stock: StockInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    func updateUI() {
        dateLabel?.text = stock?.date
        openLabel?.text = stock?.open.description
        closeLabel?.text = stock?.close.description
        if stock!.changePercent >= 0.0 {
            view.backgroundColor = .green
            changeImage.image = #imageLiteral(resourceName: "thumbsUp")
        } else {
            changeImage.image = #imageLiteral(resourceName: "thumbsDown")
            view.backgroundColor = .red
        }
    }
}
