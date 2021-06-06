//
//  WalkthroughView.swift
//  TravelApp
//
//  Created by Adam Bokun on 3.06.21.
//

import SwiftUI

struct WalkthroughView: View {
    
    @AppStorage("currentPage") var currrentPage = 1
    
    
    var body: some View {
        if currrentPage > 3 {
            HomeView()
        }
        else {
            WalkthrougScreen()
        }
    }
}

struct WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughView().preferredColorScheme(.light)
    }
}

struct WalkthrougScreen: View {
    @AppStorage("currentPage") var currrentPage = 1
    
    
    var body: some View {
        
        ZStack {
            
            if currrentPage == 1 {
                WalkthroughContentView (image: "page1", title: "Find best hotel", detail: "We can help you to find best lodging place from budget hostels to luxury suites").transition(.scale)
            }
            if currrentPage == 2 {
                WalkthroughContentView (image: "page2", title: "Book your ticket", detail: "Find the best prices for plane, bus or train tickets and book them").transition(.scale)
            }
            if currrentPage == 3 {
                WalkthroughContentView (image: "page3", title: "Enjoy your travel!", detail: "Enjoy every minute of your journey with TravelApp").transition(.scale)
            }
        }
        .overlay(
            
            Button(action: {withAnimation(.easeInOut){ currrentPage += 1 }}, label: {
                Text("   Next   ").font(.title2)
                    .fontWeight(.bold).kerning(1.4)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color("mainColor"))
                    .cornerRadius(20)
            })
            .padding(.bottom,40)
            
            ,alignment: .bottom
        )
    }
}


struct WalkthroughContentView: View {
    
    var image: String
    var title: String
    var detail: String
    
    @AppStorage("currentPage") var currrentPage = 1
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 20) {
                
                HStack {
                    
                    if currrentPage == 1{
                        
                        Text("Hello!").font(.title).fontWeight(.semibold).kerning(1.4)
                    }
                    
                    else {
                        Button(action: {
                                withAnimation(.easeInOut){ currrentPage -= 1 }}, label: {
                                    Text("Back").fontWeight(.semibold).kerning(1.2).padding(.vertical, 10)
                                })
                    }
                    
                    Spacer()
                    
                    Button(action: {
                            withAnimation(.easeInOut){ currrentPage = totalPages + 1 }}, label: {
                                Text("Skip").fontWeight(.semibold).kerning(1.2)
                            })
                    
                }
                .foregroundColor(Color("customBlack")).padding()
                
                
                
                
                Image(image).resizable().aspectRatio(contentMode: .fit)
                
                
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

var totalPages = 3
