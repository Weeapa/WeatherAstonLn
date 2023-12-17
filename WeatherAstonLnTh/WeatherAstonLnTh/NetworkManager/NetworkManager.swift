//
//  NetworkManager.swift
//  WeatherAstonLnTh
//
//  Created by Калякин Дима  on 15.12.2023.
//

import Foundation

class NetworkManager{
    //MARK: - Property
    
    static let shared: NetworkManager = NetworkManager()
    
    
   
    
    
    //MARK: - Methods
    func getWeather(city: String, result: @escaping((OfferModel?) -> () ) ){
       
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/forecast"
        urlComponents.queryItems = [URLQueryItem(name: "q", value: city),
                                    URLQueryItem(name: "appid", value: "b7594745e57435fd7b5d51e999f1e0a8")]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        
        let task = URLSession(configuration: .default)
        task.dataTask(with: request) { data, response, error in
            if error == nil {
                let decoder = JSONDecoder()
                var decoderOfferModdel: OfferModel?
                
                if data != nil {
                    decoderOfferModdel = try? decoder.decode(OfferModel.self, from: data!)
                }
                
                result(decoderOfferModdel)
            }else {
                print(error as Any)
            }
        }.resume()
    }
    
    
    //MARK: - init
    
    private init() {}  
}
