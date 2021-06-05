//
//  FindAirwaysModel.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 4.06.21.
//

import Foundation

class AirwaysRequest : ObservableObject
{
    @Published var quotes : [APIQuotes] = []
    @Published var carriers : [APICarriers] = []
    @Published var isLoaded : Bool = false
    @Published var isEmpty : Bool = false
    
    var cityFrom = ""
    var cityTo = ""
    var date = ""
    
    let db = Database()
    
    var headers = [
        "x-rapidapi-key": "80af74aef4msh2e995b15f6f92a2p1e4da5jsna06f38eba433",
        "x-rapidapi-host": "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com"
    ]
}

extension AirwaysRequest
{
    convenience init(cityFrom: String, cityTo: String, date: String)
    {
        
        self.init()
        
        self.cityFrom = db.getAirportCode(city: cityFrom)
        self.cityTo = db.getAirportCode(city: cityTo)
        self.date = date
    }
    
    func getAirways()
    {
        let request = NSMutableURLRequest(url: NSURL(string: "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsedates/v1.0/UK/USD/en-US/\(cityFrom)/\(cityTo)/\(date)")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil) {
                
                print(error as Any)
                
            } else {
                
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse as Any)
                
                do {
                    
                    let jsonData = String(decoding: data!, as: UTF8.self)
                    let response = try! JSONDecoder().decode(APIAirwaysResponse.self, from: jsonData.data(using: .utf8)!)
                    
                    DispatchQueue.main.async {
                        
                        if response.Carriers.count == 0 {
                            self.isEmpty = true
                        }
                        
                        self.carriers = response.Carriers
                        self.quotes = response.Quotes
                        self.isLoaded = true
                        
                    }
                }
            }
        })
        
        dataTask.resume()
        }
    }


struct APIAirwaysResponse : Decodable
{
    let Quotes : [APIQuotes]
    let Carriers : [APICarriers]
}

struct APIQuotes : Decodable
{
    let MinPrice : Int
}

struct APICarriers : Decodable
{
    let Name : String
}
