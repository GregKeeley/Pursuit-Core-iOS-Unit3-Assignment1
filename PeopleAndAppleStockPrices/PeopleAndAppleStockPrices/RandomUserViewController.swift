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
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noResultsLabel: UILabel!
    
    var users = [Profile]() {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.dataSource = self
        noResultsLabel.isHidden = true
        loadData()
        print(users.count)
    }
    func searchUsers(for searchText: String) {
        guard !searchText.isEmpty else { return }
        users = Users.getUsers().filter( { $0.name.last.lowercased().contains(searchText.lowercased())})
    }
    func loadData() {
        users = Users.getUsers()
    }
    func noResults() {
        if users.isEmpty == true {
            noResultsLabel.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userDetailVC = segue.destination as? UserDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow
            else {
                fatalError("Failed to properly prepare for segue ")
        }
        let user = users[indexPath.row]
        userDetailVC.user = user
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

extension RandomUserViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            return
        }
        searchUsers(for: searchText)
        noResults()
        searchBar.resignFirstResponder()
        return
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.isEmpty else {
            searchUsers(for: searchText)
            print("\(searchText)")
            noResults()
            return
        }

    }
}
