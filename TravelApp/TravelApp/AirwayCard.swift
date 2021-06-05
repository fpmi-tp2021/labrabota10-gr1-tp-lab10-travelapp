//
//  AirwayCard.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 5.06.21.
//

import SwiftUI

struct AirwayCard: View {
    
    @State var company : String
    @State var price : Int
    
    var body: some View {
        HStack {
            VStack {
                Text("Company : \(company)").font(.title3).fontWeight(.bold).fontWeight(.regular).padding(.bottom, 10)
                Text("Price : $\(price)").font(.body).fontWeight(.light)
            }.frame(width: UIScreen.main.bounds.width / 1.4, height: 80, alignment: .leading)
            VStack {
                Image(systemName: "airplane").font(.title).foregroundColor(Color.blue).imageScale(.large).frame(width: 70, height: 70,alignment: .leading)
            }.padding(10)
        }.frame(width: UIScreen.main.bounds.width, height: 80, alignment: .center).padding([.bottom, .trailing], 5)
    }
}

struct AirwayCard_Previews: PreviewProvider {
    static var previews: some View {
        AirwayCard(company: "LOT", price: 70).previewLayout(.sizeThatFits)
    }
}
