//
//  WalkthroughView2.swift
//  TravelApp
//
//  Created by Adam Bokun on 4.06.21.
//

import SwiftUI

struct WalkthroughView2: View {
    
    @State var currrentPage = 1
    
    
    var body: some View {
       
            WalkthrougScreen2()
        
        
    }
}

struct WalkthroughView2_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughView2().preferredColorScheme(.light)
    }
}

struct WalkthrougScreen2: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    @State var currrentPage = 1
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack {
            
            if currrentPage == 1 {
                WalkthroughContentView2 (image: "page1", title: "Find best hotel".localized(language), detail: "We can help you to find best lodging place from budget hostels to luxury suites".localized(language)).transition(.scale)
            }
            if currrentPage == 2 {
                WalkthroughContentView2 (image: "page2", title: "Book your ticket".localized(language), detail: "Find the best prices for plane, bus or train tickets and book them".localized(language)).transition(.scale)
            }
            if currrentPage == 3 {
                WalkthroughContentView2 (image: "page3", title: "Enjoy your travel!".localized(language), detail: "Enjoy every minute of your journey with TravelApp".localized(language)).transition(.scale)
            }
            
        }
        .overlay(

            Button(action: {withAnimation(.easeInOut){ currrentPage += 1 }}, label: {
                Text("   Next   ".localized(language)).font(.title2)
                    .fontWeight(.bold).kerning(1.4)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color("mainColor"))
                    .cornerRadius(20)
            })
            .padding(.bottom,40)

            ,alignment: .bottom
        )
        if currrentPage == 4 {
           SettingView()
        }
    }
}


struct WalkthroughContentView2: View {
    
    var image: String
    var title: String
    var detail: String
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var currrentPage = 1
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 20) {
                
                HStack {

                    if currrentPage == 1{

                        Text("Hello!".localized(language)).font(.title).fontWeight(.semibold).kerning(1.4)
                    }
                    
                    else {
                        Button(action: {
                                withAnimation(.easeInOut){ currrentPage -= 1 }}, label: {
                            Text("Back".localized(language)).fontWeight(.semibold).kerning(1.2).padding(.vertical, 10)
                        })
                    }

                    Spacer()

                    Button(action: {
                            withAnimation(.easeInOut){self.presentationMode.wrappedValue.dismiss()}}, label: {
                                Text("Skip".localized(language)).fontWeight(.semibold).kerning(1.2)
                    })
                    
                }
                .foregroundColor(Color("customBlack")).padding()

                
//                Spacer(minLength: 0)
                
                Image(image).resizable().aspectRatio(contentMode: .fit)
//                Image("page1")
//                    .resizable()
//                  .scaledToFill()
//                    .frame(alignment: .center)
//                  .clipped()
//                  .padding(.bottom)
                
                Text(title).font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("customBlack"))
                    .padding(.top)
                
                Text(detail).fontWeight(.semibold)
                    .kerning(1.3)
                    .multilineTextAlignment(.center).padding(4)
                
                Spacer(minLength: 120)
            }
        }
    }
}
