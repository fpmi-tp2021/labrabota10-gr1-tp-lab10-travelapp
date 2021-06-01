//
//  HomeView.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 1.06.21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            
            Text("Home")
            Button(action: {
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                
            }) {
                
                Text("Logout")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
