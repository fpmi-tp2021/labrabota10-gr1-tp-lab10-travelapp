//
//  FindHotelsModel.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 2.06.21.
//

import Foundation
import MapKit
import CoreLocation

class HotelRequest
{
    var checkIn : String
    var checkOut : String
    var adults = 1
    var maxPrice = 1000
    var minPrice = 50
    var city : String
    
    var latitude : String = ""
    var longitude : String = ""
    
    let dateFormatter = DateFormatter()
    
    init(city: String, checkIn: Date, checkOut: Date, adults: Int = 1, maxPrice: Int = 1000, minPrice: Int = 50) {
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        self.city = city
        self.checkIn = dateFormatter.string(from: checkIn)
        self.checkOut = dateFormatter.string(from: checkOut)
        self.adults = adults
        self.maxPrice = maxPrice
        self.minPrice = minPrice
        
    }
    
    let headers = [
        "x-rapidapi-key": "80af74aef4msh2e995b15f6f92a2p1e4da5jsna06f38eba433",
        "x-rapidapi-host": "hotels-com-provider.p.rapidapi.com"
    ]
    
    func getHotels() {
        
        getCoordinateFrom(address: city) { coordinate, error in
            guard let coordinate = coordinate, error == nil else { return }
            // don't forget to update the UI from the main thread
            DispatchQueue.main.async {
                
                self.latitude = coordinate.latitude.description
                self.longitude = coordinate.longitude.description
                
                print(self.city , "  :  " , coordinate)
        
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let request = NSMutableURLRequest(url: NSURL(string: "https://hotels-com-provider.p.rapidapi.com/v1/hotels/nearby?locale=en_US&sort_order=STAR_RATING_HIGHEST_FIRST&latitude=\(self.latitude)&adults_number=\(self.adults)&checkout_date=\(self.checkOut)&currency=USD&checkin_date=\(self.checkIn)&longitude=\(self.longitude)&price_min=\(self.minPrice)&price_max=\(self.maxPrice)")! as URL,cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
            request.allHTTPHeaderFields = self.headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse as Any)
                
                do {
                    let jsonData = String(decoding: data!, as: UTF8.self)
                    let response = try! JSONDecoder().decode(APIResponse.self, from: jsonData.data(using: .utf8)!)
                    
                    print(response.searchResults.totalCount as Any)
                }
            }
        })
        
        dataTask.resume()
        }
    }
    
    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
    }
}

struct APIResponse : Decodable
{
    let header : String?
    let searchResults : APIResult
}

struct APIResult : Decodable
{
    let totalCount : Int?
    var results : [APIHotel]
}

struct APIHotel : Decodable
{
    let id : Int?
    let name : String?
    let starRating : Double?
    let ratePlan : APIRatePlan
}

struct APIRatePlan : Decodable
{
    let price : APIPrice
}

struct APIPrice : Decodable
{
    let current : String
    let exactCurrent : Double?
}
