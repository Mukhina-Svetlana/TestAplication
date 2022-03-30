//
//  Model.swift
//  TestTask
//
//  Created by Светлана Мухина on 30.03.2022.
//

import Foundation
struct Model {
    let name: String
    
    init(currentData: Drink) {
        name = currentData.strDrink
    }
}
