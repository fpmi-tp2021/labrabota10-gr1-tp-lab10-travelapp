//
//  ContactView.swift
//  TravelApp
//
//  Created by Adam Bokun on 4.06.21.
//

import SwiftUI

struct ContactView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var usersReport: String = ""
    @State var show = false
    @State var isPresented1 = false
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {self.presentationMode.wrappedValue.dismiss()}, label: {
                    Image(systemName: "chevron.backward")
                }).frame(width: UIScreen.main.bounds.width - 50, height: 60, alignment: .leading)
            }
            
            HStack{
            Text("Contact us").font(.title).fontWeight(.semibold).kerning(1.2)
            }.frame(width: UIScreen.main.bounds.width - 50, height: 100, alignment: .center)
            
            
            VStack{
                Text("Dzmitry Siemianovich").font(.title2).fontWeight(.semibold).kerning(1.2).multilineTextAlignment(.leading)
                Link("dima.semenovich@icloud.com", destination: URL(string: "mailto:dima.semenovich@icloud.com")!).font(.title3).multilineTextAlignment(.leading)
                Link("@dimaS0611", destination: URL(string: "https://github.com/dimaS0611")!).font(.title3).multilineTextAlignment(.leading)
            }.frame(width: UIScreen.main.bounds.width - 50, height: 120)
            
            VStack{
                Text("Adam Bokun").font(.title2).fontWeight(.semibold).kerning(1.2).multilineTextAlignment(.leading)
                Link("adambokun@icloud.com", destination: URL(string: "mailto:adambokun@icloud.com")!).font(.title3).multilineTextAlignment(.leading)
                Link("@adamme17", destination: URL(string: "https://github.com/adamme17")!).font(.title3).multilineTextAlignment(.leading)
            }.frame(width: UIScreen.main.bounds.width - 50, height: 120)
            
            VStack{
                Text("Nastya Korostelyova").font(.title2).fontWeight(.semibold).kerning(1.2).multilineTextAlignment(.leading)
                Link("korostelyovan@gmail.com", destination: URL(string: "mailto:korostelyovan@gmail.com")!).font(.title3).multilineTextAlignment(.leading)
                Link("@YourUsako", destination: URL(string: "https://github.com/YourUsako")!).font(.title3).multilineTextAlignment(.leading)
            }.frame(width: UIScreen.main.bounds.width - 50, height: 120)
            
            
            Spacer(minLength: 100)
            
           
        }
    }

}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
            
    }
}
