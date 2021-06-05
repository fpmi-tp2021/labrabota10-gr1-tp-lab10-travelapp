//
//  HotelCard.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 2.06.21.
//

import SwiftUI

struct HotelCard: View {
    
    @State var stars : Int
    @State var name : String
    @State var distance : String
    @State var price : String
    
    var body: some View {
        HStack{

           // Image("logo").resizable().frame( width: 150, height: 150, alignment: .center).scaledToFit()
              //  .imageScale(.small).background(Color.white).cornerRadius(15)
            
            VStack{
            VStack(alignment: .leading) {
               
                Text("\(name)").font(.title2).fontWeight(.regular).lineLimit(1).frame(maxWidth: .infinity, alignment: .leading).padding(.bottom, 1)
                
                HStack {
                    ForEach(0..<stars, id: \.self) { item in
                        Image(systemName: "star.fill").font(.body).foregroundColor(.yellow)
                    }
                }.padding(.bottom)
                
                
                Text("From city center \(distance)").font(.body).fontWeight(.light)
                Text("Price \(price)").font(.body).fontWeight(.light)


            }
            }
        }.padding(.bottom, 5)
        
    }
}

struct HotelCard_Previews: PreviewProvider {
    static var previews: some View {
        HotelCard(stars: 4, name: "London", distance: "1.5 mile", price: "150$").previewLayout(.sizeThatFits)
    }
}
