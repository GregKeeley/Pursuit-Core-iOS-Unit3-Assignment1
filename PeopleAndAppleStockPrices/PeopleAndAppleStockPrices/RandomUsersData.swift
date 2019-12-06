//
//  RandomUsersData.swift
//  PeopleAndAppleStockPrices
//
//  Created by Gregory Keeley on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Users: Codable {
    let results: [Profile]
}

struct Profile: Codable {
    let name: NameInfo
    let location: LocationInfo
    let dob: String
    let registered: String
    let phone: String
    let cell: String
}

struct NameInfo: Codable {
    let title: String
    let first: String
    let last: String
}

struct LocationInfo: Codable {
    let street: String
    let city: String
    let state: String
    let postcode: String
}

extension Users {
    static func getUsers() -> [Profile] {
        var users = [Profile]()
        guard let fileURL = Bundle.main.url(forResource: "userinfo", withExtension: "json") else {
            fatalError("Could not locate userinfo.json")
        }
        do  {
            let data = try Data(contentsOf: fileURL)
            let usersData = try JSONDecoder().decode(Users.self, from: data)
            users = usersData.results
        } catch {
            fatalError("Failed to load contents: \(error)")
        }
        return users
    }
}
