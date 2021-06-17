//
//  NetworkViewController.swift
//  client-server-course-3
//
//  Created by Artur Igberdin on 17.06.2021.
//

import UIKit
import Alamofire

class NetworkViewController: UIViewController {

    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiService.getWeatherData(city: "Moscow") { value in
            
            print(value as Any)
            
        }

        //firstRequest()
        //secondRequest()
        
        //thirdRequest()
        
        
    }
    
    func thirdRequest() {
        
        let parameters: Parameters = [
                    "q": "München,DE",
                    "appid": "b1b15e88fa797225412429c1c50c122a1"
                ]


        
        AF.request("http://samples.openweathermap.org/data/2.5/forecast", parameters: parameters)
            .responseJSON { response in
            
                print(response.value as Any)
        }
        
    }
 
    //POST-запрос
    func secondRequest() {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        //URLComponents делает нам правильную кодировку
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "http"
        urlConstructor.host = "samples.openweathermap.org"
        urlConstructor.path = "/data/2.5/forecast"
        urlConstructor.queryItems = [
            URLQueryItem(name: "q", value: "München,DE"),
            URLQueryItem(name: "appid", value: "b1b15e88fa797225412429c1c50c122a1")
        ]
        
        var request = URLRequest(url: urlConstructor.url!)
        request.httpMethod = "POST"
        
        let task = session.dataTask(with: request) { data, response, error in
          
            guard let data = data else { return }

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(json)
            } catch {
                print(error)
            }
        }
        task.resume()

    }

    //Простой GET запрос
    func firstRequest() {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1") else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
          
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(json)

            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    
    
}
