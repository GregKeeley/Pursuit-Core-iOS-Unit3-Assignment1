//
//  UserDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Gregory Keeley on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var registeredDateLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    
    
    var user: Profile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    func updateUI() {
        dobLabel.text = user?.dob
        registeredDateLabel.text = user?.registered
        phoneLabel.text = user?.phone
        cellLabel.text = user?.cell
        userImage.image = #imageLiteral(resourceName: "profileImage")
    }
}
