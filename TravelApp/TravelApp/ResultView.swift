//
//  ResultView.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 5.06.21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct ResultView: View {
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    var hotelName: String
    var hotelPrice: String
    
    var airwayCompany: String
    var airwayPrice: Int
    
    let database = Firestore.firestore()
    
    @State var isPresented = false
    
    var body: some View {
        VStack{
            
            Text("Your choise".localized(language)).fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 50)
            
            Group {
           
                HotelCard(stars: 0, name: hotelName, distance: "", price: hotelPrice)
                 
                AirwayCard(company: airwayCompany, price: airwayPrice)
            
            }.padding(.top, 30)
            
            Spacer()
            Spacer()
            /*
            Button(action: {
                saveData(hotelName: hotelName, hotelPrice: hotelPrice, airwayCompany: airwayCompany, airwayPrice: airwayPrice.description)
                
                self.isPresented.toggle()
            }) {
                
                    
                    Text("Submit").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                    
                    
            }.fullScreenCover(isPresented: $isPresented, content: {
                AccountView()
            }).background(Color("mainColor"))
                .clipShape(Capsule())
                .padding(.top, 45)
            */
            Spacer()
        }
    }
    
    func saveData(hotelName: String, hotelPrice: String, airwayCompany: String, airwayPrice: String)
    {
        let userID : String = (FirebaseAuth.Auth.auth().currentUser?.uid)!
        let docRef = database.document("\(userID)/reservation")
        
        docRef.setData(["hotelName" : airwayCompany,
                        "hotelPrice" : airwayPrice,
                        "airwayCompany" : airwayCompany,
                        "airwayPrice" : airwayPrice])
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(hotelName: "Hotel", hotelPrice: "$200", airwayCompany: "LOT", airwayPrice: 100)
    }
}
