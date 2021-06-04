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
            
            HStack{
                Text("Dzmitry Siemianovich").font(.title2).fontWeight(.semibold).kerning(1.2)
           
            }.frame(width: UIScreen.main.bounds.width - 50, height: 50, alignment: .leading)
            HStack{
//                Text("dima.semenovich@icloud.com").font(.title3).fontWeight(.regular).kerning(1.2)
                Link("dima.semenovich@icloud.com", destination: URL(string: "mailto:dima.semenovich@icloud.com")!).font(.title3)
            }.frame(width: UIScreen.main.bounds.width - 50, height: 30, alignment: .leading)
            HStack{
                Link("@dimaS0611", destination: URL(string: "https://github.com/dimaS0611")!).font(.title3)
            }.frame(width: UIScreen.main.bounds.width - 50, height: 30, alignment: .leading)
            
            HStack{
                Text("Adam Bokun").font(.title2).fontWeight(.semibold).kerning(1.2)
           
            }.frame(width: UIScreen.main.bounds.width - 50, height: 50, alignment: .leading).padding(.top)
            HStack{
//                Text("dima.semenovich@icloud.com").font(.title3).fontWeight(.regular).kerning(1.2)
                Link("adambokun@icloud.com", destination: URL(string: "mailto:adambokun@icloud.com")!).font(.title3)
            }.frame(width: UIScreen.main.bounds.width - 50, height: 30, alignment: .leading)
            HStack{
                Link("@adamme17", destination: URL(string: "https://github.com/adamme17")!).font(.title3)
            }.frame(width: UIScreen.main.bounds.width - 50, height: 30, alignment: .leading)
            
            HStack{
                Text("Nastya Korostelyova").font(.title2).fontWeight(.semibold).kerning(1.2)
           
            }.frame(width: UIScreen.main.bounds.width - 50, height: 50, alignment: .leading).padding(.top)
//            HStack{
////                Text("dima.semenovich@icloud.com").font(.title3).fontWeight(.regular).kerning(1.2)
//                Link("dima.semenovich@icloud.com", destination: URL(string: "mailto:dima.semenovich@icloud.com")!).font(.title3)
//            }.frame(width: UIScreen.main.bounds.width - 50, height: 30, alignment: .leading)
//            HStack{
//                Link("@dimaS0611", destination: URL(string: "https://github.com/dimaS0611")!).font(.title3)
//            }.frame(width: UIScreen.main.bounds.width - 50, height: 30, alignment: .leading)
//
            
            Spacer(minLength: 100)
            
           
        }
    }

}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
            
    }
}
