//
//  RandomUserViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Gregory Keeley on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController {
// Reuse ID: "userCell"
    
    @IBOutlet weak var tableView: UITableView!
    var users = [Profile]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        print(users.count)
    }
    func loadData() {
        users = Users.getUsers()
    }
}

extension RandomUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let userInfo = users[indexPath.row]
        cell.textLabel?.text = ("\(userInfo.name.title) \(userInfo.name.first) \(userInfo.name.last)")
        cell.detailTextLabel?.text = ("\(userInfo.location.street),\(userInfo.location.city),\(userInfo.location.state)\(userInfo.location.postcode)")
        return cell
    }
    
}
