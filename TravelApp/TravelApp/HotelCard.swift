//
//  HotelCard.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 2.06.21.
//

import SwiftUI

struct HotelCard: View {
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    @State var stars : Int
    @State var name : String
    @State var distance : String
    @State var price : String
    
    var body: some View {
        
        HStack{
            
            VStack(alignment: .leading) {
                
                Text("\(name)").font(.title2).fontWeight(.regular).lineLimit(1).frame(maxWidth: .infinity, alignment: .leading).padding(.bottom, 1)
                
                HStack {
                    
                    ForEach(0..<stars, id: \.self) { item in
                        
                        Image(systemName: "star.fill").font(.body).foregroundColor(.yellow)
                    }
                }.padding(.bottom)
                
                Text("From city center \(distance)".localized(language)).font(.body).fontWeight(.light)
                
                Text("Price \(price)".localized(language)).font(.body).fontWeight(.light)
                
            }
            
            
            Image(systemName: "house.fill").font(.title).foregroundColor(Color.blue).imageScale(.large).frame(width: 70, height: 70,alignment: .leading)
            
        }.padding(10)
        
    }
}

struct HotelCard_Previews: PreviewProvider {
    static var previews: some View {
        HotelCard(stars: 4, name: "London", distance: "1.5 mile", price: "150$").previewLayout(.sizeThatFits)
    }
}
