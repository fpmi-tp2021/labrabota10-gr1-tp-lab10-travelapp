//
//  HomeView.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 1.06.21.
//

import SwiftUI

struct HomeView: View {
    
    @State var city = ""
    @State var checkIn = Date()
    @State var checkOut = Date()
    @State var adults = 1
    @State var maxPrice = 300
    @State var minPrice = 150
    
    var body: some View {
        
        VStack {
            
            /* Logout button
             VStack(alignment: .leading){
             Button(action: {
             UserDefaults.standard.set(false, forKey: "status")
             NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
             
             }) {
             
             Image("logout").resizable().imageScale(.small).frame(width: 20.0, height: 20.0)
             }
             }.frame(width: UIScreen.main.bounds.width - 30, height: 20, alignment: .leading)
             */
            
            ZStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: 55)
                    .foregroundColor(Color(.secondarySystemBackground))
                    .padding()
                
                TextField("Find your travel direction", text: $city)
                    .padding(.leading)
                    .offset(x: 12)
                
                Button(action: {
                    let hotelsRequest = HotelRequest(city: city, checkIn: checkIn, checkOut: checkOut, adults: adults, maxPrice: maxPrice, minPrice: minPrice)
                    
                        hotelsRequest.getHotels()
                    
                }, label: {
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundColor(Color(.systemTeal))
                        .overlay(Image(systemName: "magnifyingglass")
                                    .foregroundColor(.white))
                        .padding(.trailing)
                        .offset(x: -5)
                })
                
            }
            
            Form{
                
                Section(header: Text("Date").fontWeight(.heavy).font(.title3)){
                    
                    VStack{
                        
                        DatePicker("Check in date", selection: $checkIn, displayedComponents: [.date])
                    }
                    VStack{
                        
                        DatePicker("Check out date", selection: $checkOut, displayedComponents: [.date])
                    }
                    
                }
                Section(header: Text("People").fontWeight(.heavy).font(.title3)) {
                    
                    
                    Stepper("Amount of adults  \(adults)", value: $adults, in: 1...6)
                    
                }
                
                Section(header: Text("Price").fontWeight(.heavy).font(.title3)) {
                    
                    Stepper("Maximum price  \(maxPrice)", value: $maxPrice, in: 300...1000, step: 20)
                    
                    Stepper("Minimum price  \(minPrice)", value: $minPrice, in: 50...700, step: 20)

                }
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
