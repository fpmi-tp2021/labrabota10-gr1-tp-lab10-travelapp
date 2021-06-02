//
//  HomeView.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 1.06.21.
//

import SwiftUI

struct HomeView: View {
    
    @State var text = ""

    var body: some View {
        
        let hotelsModel = HotelRequest()
        
        VStack {
        HStack(alignment: .lastTextBaseline){
            Button(action: {
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                
            }) {
                
                Text("Logout")
            }
        }
        
            ZStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: 55)
                    .foregroundColor(Color(.secondarySystemBackground))
                    .padding()
                
                TextField("Find your travel direction", text: $text)
                    .padding(.leading)
                    .offset(x: 12)
                
                Button(action: { hotelsModel.getHotels() }, label: {
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundColor(Color(.systemTeal))
                        .overlay(Image(systemName: "magnifyingglass")
                                    .foregroundColor(.white))
                        .padding(.trailing)
                        .offset(x: -5)
                })
                
            }.padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
