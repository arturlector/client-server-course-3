//
//  APIService.swift
//  client-server-course-3
//
//  Created by Artur Igberdin on 17.06.2021.
//

import Foundation
import Alamofire

//class UserManager {
//    
//    init(apiService1: APIServiceProtocol, apiService2: APIServiceProtocol2)
//}

protocol APIServiceProtocol {
    func getWeatherData(city: String, completion: @escaping(Any?)->())
}

class APIService: APIServiceProtocol {
    
    let baseUrl = "http://api.openweathermap.org"
    let apiKey = "92cabe9523da26194b02974bfcd50b7e"
    
    func getWeatherData(city: String, completion: @escaping(Any?)->()) {
        
        let path = "/data/2.5/forecast"
        let parameters: Parameters = [
            "q": city,
            "units": "metric",
            "appid": apiKey
        ]

        let url = baseUrl+path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            completion(repsonse.value)
        }
        
    }
}
