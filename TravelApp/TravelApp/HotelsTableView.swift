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
    
    @State var isPresented = false
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
                Button(action: {self.isPresented.toggle()}, label: {
                    Image(systemName: "gear")
                }).fullScreenCover(isPresented: $isPresented, content: {
                    SettingView()
                }).padding(.trailing)
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
        List(hotels) { hotel in
            NavigationLink(
                destination: GetOriginPlace(cityTo: city, name: hotel.name ,price: hotel.ratePlan.price.current ?? "$--", date: date),
                label: {
                    HotelCard(stars: Int(hotel.starRating), name: hotel.name, distance: hotel.landmarks[0].distance ?? "--", price: hotel.ratePlan.price.current ?? "$---")
                })
            
        }.navigationBarTitle("\(city) hotels")
    }
    
    
}

struct HotelsTableView_Previews: PreviewProvider {
    static var previews: some View {
        HotelsTableView(hotels: [APIHotel.init(id: 1, name: "Hotel name", starRating: 3, landmarks: [APILandmarks.init(label: "", distance: "3 miles")], ratePlan: APIRatePlan.init(price: APIPrice.init(current: "$50", exactCurrent: 50)))], city: "London", date: "2021-07-01")
    }
}
