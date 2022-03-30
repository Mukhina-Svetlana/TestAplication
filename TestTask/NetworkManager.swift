//
//  NetworkManager.swift
//  TestTask
//
//  Created by Светлана Мухина on 30.03.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func fetchFilms(completionHandled: @escaping ([Model]) -> Void) {
        let request = AF.request("https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic")
        request.responseDecodable(of: CurrentData.self) { (response) in
            guard let data = response.value else { return }
            var arrayModels = [Model]()
            for i in data.drinks {
                arrayModels.append(Model(currentData: i))
            }
            completionHandled(arrayModels)
        }
    }
}
