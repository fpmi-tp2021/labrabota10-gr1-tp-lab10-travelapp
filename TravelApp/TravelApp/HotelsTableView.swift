//
//  HotelsTableView.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 3.06.21.
//

import SwiftUI

struct LoadView: View {
    
    @ObservedObject var hotels = HotelRequest()
    @State var searchResult : [APIHotel]?
    @State var status = false
    
    var body: some View {
        Group {
            if hotels.dataHasLoaded {
                HotelsTableView(hotels: hotels.searchData, city: hotels.city, date: hotels.checkIn)
            } else {
                ProgressView()
            }
        }.alert(isPresented: $hotels.isEmpty, content: {
            Alert(title: Text("There are no flights"), message: Text("There are no flights on this date"), dismissButton: .default(Text("Ok")))
        }).onAppear {
            self.hotels.getHotels()
        }
    }
}

struct HotelsTableView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var hotels : [APIHotel]
    var city : String
    var date : String
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {self.presentationMode.wrappedValue.dismiss()}, label: {
                    Text("Cancel")
                }).padding(.trailing)
             /*   Button(action: {}, label: {
                    Image(systemName: "gear")
                }).padding(.trailing)*/
            }.frame(width: UIScreen.main.bounds.width - 30, height: 20, alignment: .trailing)
            
            NavigationView {
                TableView(hotels: hotels, city: city, date: date)
            }
            
        }
    }
}

struct TableView: View {
    
    var hotels : [APIHotel]
    var city : String
    var date : String
    
    var body: some View {
        List(0..<hotels.count) { i in
            NavigationLink(
                destination: GetOriginPlace(cityTo: city, date: date),
                label: {
                    HotelCard(stars: Int(hotels[i].starRating), name: hotels[i].name, distance: hotels[i].landmarks[0].distance ?? "--", price: hotels[i].ratePlan.price.current ?? "$---")
                })
            
        }.navigationBarTitle("\(city) hotels")
    }
}

struct HotelsTableView_Previews: PreviewProvider {
    static var previews: some View {
        HotelsTableView(hotels: [APIHotel.init(id: 1, name: "Hotel name", starRating: 3, landmarks: [APILandmarks.init(label: "", distance: "3 miles")], ratePlan: APIRatePlan.init(price: APIPrice.init(current: "$50", exactCurrent: 50)))], city: "London", date: "2021-07-01")
    }
}
