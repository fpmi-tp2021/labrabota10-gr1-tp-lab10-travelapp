//
//  ReportView.swift
//  TravelApp
//
//  Created by Adam Bokun on 4.06.21.
//

import SwiftUI




struct ReportView: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
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
                Text("Reporting a bug".localized(language)).font(.title).fontWeight(.semibold).kerning(1.2)
                
            }
            
            VStack(alignment: .leading) {
                Text("First, thank you for reporting bugs! Identifying, reproducing, and documenting bugs is not always fun or easy, but it’s an important part of making excellent software. It can also be rewarding, as you’ll have a direct influence on the applications. We really, honestly appreciate your help. Please describe a bug as detailed as possible in the textfield below and we will fix it.\n".localized(language))
                    .font(.callout).foregroundColor(Color("customBlack"))
                
                TextField("Write here...".localized(language), text: $usersReport)
                    .multilineTextAlignment(.leading)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            
            Spacer()
            
            Button(action: {
                
                self.show.toggle()
                
            }) {
                
                Text("   Report   ".localized(language)).font(.title2)
                    .fontWeight(.bold).kerning(1.4)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color("mainColor"))
                    .cornerRadius(20)
            }
            .padding(.bottom).sheet(isPresented: $show) {
                
                Report(show: self.$show)
            }
        }
        
        
    }
}



struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView().preferredColorScheme(.light)
    }
}

struct Report : View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    @Binding var show : Bool
    @State var isPresented1 = false
    
    var body : some View{
        
        VStack{
            HStack{
                Text("Thank you for your attention!\n".localized(language)).font(.title2).fontWeight(.semibold).kerning(1.2)
            }
            HStack{
                Text("We will try to solve your problem as quickly as possible.".localized(language)).font(.title3).fontWeight(.semibold).kerning(1.2).multilineTextAlignment(.center)
            }
            
            HStack(){
                Button(action: {
                    
                    self.isPresented1.toggle()
                    
                }) {
                    
                    Text("   Go home   ".localized(language)).font(.title2)
                        .fontWeight(.bold).kerning(1.4)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color("mainColor"))
                        .cornerRadius(20)
                }.fullScreenCover(isPresented: $isPresented1, content: {
                    HomeView()
                }).padding()
            }
            
        }
    }
}
