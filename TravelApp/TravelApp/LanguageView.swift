//
//  LanguageView.swift
//  TravelApp
//
//  Created by Adam Bokun on 4.06.21.
//

import SwiftUI

struct LanguageView: View {
    @State var isPresented6 = false
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    var body: some View {
        NavigationView {
            
            List {
                Section {
                    Button(action: {
                        LocalizationService.shared.language = .english
                        self.isPresented6.toggle()
                        
                    }) {
                        SettingsCell(title: "English".localized(language), imgName: "", clr: Color("customBlack"))
                            .foregroundColor(Color("customBlack"))
                    }.fullScreenCover(isPresented: $isPresented6, content: {
                        SettingView()
                    })
                    
                    Button(action: {
                        LocalizationService.shared.language = .belarusian
                        self.isPresented6.toggle()
                        
                    }) {
                        SettingsCell(title: "Belarusian".localized(language), imgName: "", clr: Color("customBlack"))
                            .foregroundColor(Color("customBlack"))
                    }.fullScreenCover(isPresented: $isPresented6, content: {
                        SettingView()
                    })
                    
                    Button(action: {
                        
                        LocalizationService.shared.language = .russian
                        
                        self.isPresented6.toggle()
                        
                    }) {
                        SettingsCell(title: "Russian".localized(language), imgName: "", clr: Color("customBlack"))
                            .foregroundColor(Color("customBlack"))
                    }.fullScreenCover(isPresented: $isPresented6, content: {
                        SettingView()
                    })
                    
                }
                
            }.listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle("Language".localized(language))
            .overlay(
                
                Button(action: {
                    self.isPresented6.toggle()
                    
                }) {
                    Text("Back")
                        .foregroundColor(Color("customBlack"))
                }.fullScreenCover(isPresented: $isPresented6, content: {
                    SettingView()
                })
                .padding(.bottom,40)
                
                ,alignment: .bottom
            )
            
            
        }
    }
    
    
    
    
    
    
    struct LanguageView_Previews: PreviewProvider {
        static var previews: some View {
            LanguageView().preferredColorScheme(.light)
        }
    }
}
