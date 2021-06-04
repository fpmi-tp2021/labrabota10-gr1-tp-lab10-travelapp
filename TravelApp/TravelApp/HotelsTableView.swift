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
                HotelsTableView(hotels: hotels.searchData)
            } else {
                ProgressView()
            }
        }.onAppear {
            self.hotels.getHotels()
        }
    }
}

struct HotelsTableView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var hotels : [APIHotel]
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {self.presentationMode.wrappedValue.dismiss()}, label: {
                    Image(systemName: "chevron.backward")
                }).frame(width: UIScreen.main.bounds.width - 30, height: 20, alignment: .leading)
            }
            NavigationView {
                TableView(hotels: hotels)
            }
            
        }
    }
}

struct TableView: View {
    
    var hotels : [APIHotel]
    
    var body: some View {
        List(0..<hotels.count) { i in
            HotelCard(stars: Int(hotels[i].starRating), name: hotels[i].name, distance: hotels[i].landmarks[0].distance ?? "--", price: hotels[i].ratePlan.price.current ?? "$---")
        }.navigationBarTitle("Hotels of the city")
    }
}

struct HotelsTableView_Previews: PreviewProvider {
    static var previews: some View {
        HotelsTableView(hotels: [])
    }
}
