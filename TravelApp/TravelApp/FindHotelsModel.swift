//
//  FindHotelsModel.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 2.06.21.
//

import Foundation
class HotelRequest{
let headers = [
    "x-rapidapi-key": "80af74aef4msh2e995b15f6f92a2p1e4da5jsna06f38eba433",
    "x-rapidapi-host": "hotels-com-provider.p.rapidapi.com"
]

let request = NSMutableURLRequest(url: NSURL(string: "https://hotels-com-provider.p.rapidapi.com/v1/hotels/nearby?locale=en_US&sort_order=STAR_RATING_HIGHEST_FIRST&latitude=51.509865&adults_number=1&checkout_date=2022-03-27&currency=USD&checkin_date=2022-03-26&longitude=-0.118092")! as URL,cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    
    func getHotels() {
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                //print(httpResponse as Any)
                print(data as Any)
            }
        })
        
        dataTask.resume()
    }
}
