//
//  AirwaysTableView.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 5.06.21.
//

import SwiftUI

struct AirwaysLoadView : View {
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    @ObservedObject var airways = AirwaysRequest()
    @State var carriers : [APICarriers]?
    @State var quotes : [APIQuotes]?
    
    @State var name = ""
    @State var price = ""
    
    var body: some View {
        
        Group {
            if airways.isLoaded {
                AirwaysTableView(carriers: airways.carriers, quotes: airways.quotes, from: airways.cityFrom, to: airways.cityTo, name: self.name, price: self.price)
            } else {
                ProgressView()
            }
        }.onAppear {
            self.airways.getAirways()
        }.alert(isPresented: $airways.isEmpty, content: {
            Alert(title: Text("There are no flights".localized(language)), message: Text("There are no flights on this date".localized(language)), dismissButton: .default(Text("Ok")))
        })
        
    }
}

struct AirwaysTableView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isPresented = false
    
    var carriers : [APICarriers]
    var quotes : [APIQuotes]
    var from : String
    var to : String
    
    @State var name = ""
    @State var price = ""
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {self.presentationMode.wrappedValue.dismiss()}, label: {
                    Image(systemName: "chevron.backward")
                }).frame(width: UIScreen.main.bounds.width / 2 - 30, height: 20, alignment: .leading)
                Button(action: {self.isPresented.toggle()}, label: {
                    Image(systemName: "gear")
                }).fullScreenCover(isPresented: $isPresented, content: {
                    SettingView()
                }).frame(width: UIScreen.main.bounds.width / 2 - 30, height: 20, alignment: .trailing)
            }
            
            NavigationView {
                AirwaysTable(carriers: carriers, quotes: quotes, from: from, to: to, name: name, price: price)
            }
            
        }
    }
}

struct AirwaysTable : View {
    
    var carriers : [APICarriers]
    var quotes : [APIQuotes]
    var from : String
    var to : String
    var name = ""
    var price = ""
    
    var body: some View {
        
        List(0..<carriers.count) { i in
            NavigationLink(
                destination: ResultView(hotelName: name, hotelPrice: price, airwayCompany: carriers[i].Name, airwayPrice: quotes[i].MinPrice),
                label: {
                AirwayCard(company: carriers[i].Name, price: quotes[i].MinPrice)
                })
            
        }.navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("\(from) ").font(.title)
                    Image(systemName: "arrow.right")
                    Text(" \(to)").font(.title)
                }.padding(.bottom, -50.0)
            }
        }
    }
}

struct AirwaysTableView_Previews: PreviewProvider {
    static var previews: some View {
        AirwaysTableView(carriers: [ APICarriers.init(Name: "Hawaiian Airlines"), APICarriers.init(Name: "Alaska Airlines")], quotes: [ APIQuotes.init(MinPrice: 500), APIQuotes.init(MinPrice: 400)], from: "IST", to: "NYC")
    }
}
