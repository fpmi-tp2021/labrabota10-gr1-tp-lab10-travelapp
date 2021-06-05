//
//  PersonalAccountView.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 5.06.21.
//

import SwiftUI
import Firebase
import FirebaseAuth

class PersonalAccountDataView : ObservableObject {
    @Published var hotelName : String = ""
    @Published var hotelPrice : String = ""
    
    @Published var airwayCompany : String = ""
    @Published var airwayPrice : String = ""
    
    @Published var isLoad : Bool = false
    @Published var isEmpty : Bool = false
}

struct PersonalAccountView : View {
    
    @ObservedObject var data = PersonalAccountDataView()
    
    var body : some View {
        
        Group {
            if data.isLoad {
                AccountView(hotelName: data.hotelName, hotelPrice: data.hotelPrice, airwayCompany: data.airwayCompany, airwayPrice: data.airwayPrice)
            } else {
                ProgressView()
            }
        }
        
    }
    
    func loadAccountData() {
        
        let ref = Firebase.Database.database().reference()
        let userID : String = (FirebaseAuth.Auth.auth().currentUser?.uid)!
        
        ref.child("reservation").child(userID).observe(.value) { (snapshot) in
            if let dictionary = snapshot.value as? [String:Any] {
                let hotelName = dictionary["hotelName"] as? String
                
                let hotelPrice = dictionary["hotelPrice"] as? String
                
                let airwayCompany = dictionary["airwayCompany"] as? String
                
                let airwayPrice = dictionary["airwayPrice"] as? String
                
                DispatchQueue.main.async {
                    self.data.hotelName = hotelName ?? ""
                    self.data.hotelPrice = hotelPrice ?? ""
                    self.data.airwayCompany = airwayCompany ?? ""
                    self.data.airwayPrice = airwayPrice ?? ""
                    
                    self.data.isLoad = true
                    
                    if(airwayPrice == nil && airwayCompany == nil && hotelName == nil && hotelPrice == nil) {
                        self.data.isEmpty = true
                    }
                }
            }
        }
    }
}

struct AccountView : View {
    
    var hotelName: String = ""
    var hotelPrice: String = ""
    
    var airwayCompany: String = ""
    var airwayPrice: String = ""
    
    var body: some View {
        VStack{
            
            Text("Your reservation").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 50)
            
            Group {
                
                HotelCard(stars: 0, name: hotelName, distance: "", price: hotelPrice)
                
                AirwayCard(company: airwayCompany, price: Int(airwayPrice) ?? 0)
                
            }.padding(.top, 30)
            
            Spacer()
            Spacer()
            
            Button(action: {
            }) {
                Text("Submit").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                
            }.background(Color("mainColor"))
            .clipShape(Capsule())
            .padding(.top, 45)
            
            Spacer()
        }
    }
}

struct PersonalAccountView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalAccountView()
    }
}
