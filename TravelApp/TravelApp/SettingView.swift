//
//  SettingView.swift
//  TravelApp
//
//  Created by Adam Bokun on 4.06.21.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isPresented1 = false
    @State var isPresented2 = false
    @State var isPresented3 = false
    @State var isPresented4 = false
    @State var isPresented5 = false

    
    var body: some View {
        NavigationView {
            
            List {
                Section {
                    Button(action: {
                        self.isPresented5.toggle()
                        
                    }) {
                        SettingsCell(title: "Language", imgName: "globe", clr: Color("customBlack"))
                            .foregroundColor(Color("customBlack"))
                    }.fullScreenCover(isPresented: $isPresented5, content: {
                        LanguageView()
                    })
                   
                }
                Section {
                    Button(action: {
                        self.isPresented4.toggle()
                        
                    }) {
                        SettingsCell(title: "Navigation", imgName: "shuffle", clr: Color("customBlack"))
                            .foregroundColor(Color("customBlack"))
                    }.fullScreenCover(isPresented: $isPresented4, content: {
                        WalkthroughView2()
                    })
                    Button(action: {
                        self.isPresented3.toggle()
                        
                    }) {
                        SettingsCell(title: "About us", imgName: "info.circle", clr: Color("customBlack"))
                            .foregroundColor(Color("customBlack"))
                    }.fullScreenCover(isPresented: $isPresented3, content: {
                        ContactView()
                    })
                }
                Section {
                    Button(action: {
                        self.isPresented2.toggle()
                        
                    }) {
                        SettingsCell(title: "Report a bug", imgName: "ladybug.fill", clr: Color("customBlack"))
                            .foregroundColor(Color("customBlack"))
                    }.fullScreenCover(isPresented: $isPresented2, content: {
                        ReportView()
                    })
                   
                }
                
                
                
            }.listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle("Settings")
            .overlay(
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Text("Back")
                        .foregroundColor(Color("customBlack"))
                }.padding(.bottom,80)
                
                ,alignment: .bottom
            )
            .overlay(
                
                Button(action: {
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                }) {
                    Text("Log Out").font(.headline)
                        .fontWeight(.regular).kerning(1.0)
                        .foregroundColor(Color.red).foregroundColor(Color("customBlack"))
                }
                .padding(.bottom,40)
                
                ,alignment: .bottom
            )
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .preferredColorScheme(.light)
    }
}
