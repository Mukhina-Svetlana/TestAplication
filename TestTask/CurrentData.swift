//
//  CurrentData.swift
//  TestTask
//
//  Created by Светлана Мухина on 30.03.2022.
//

import Foundation

struct CurrentData: Codable {
    let drinks: [Drink]
}

struct Drink: Codable {
    let strDrink: String
}
