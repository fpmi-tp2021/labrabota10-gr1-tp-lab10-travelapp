//
//  LocalizationService.swift
//  TravelApp
//
//  Created by Adam Bokun on 5.06.21.
//

import Foundation


enum Language: String {
    case russian = "ru"
    case english = "en"
    case belarusian = "be"
}

class LocalizationService {

    static let shared = LocalizationService()
    static let changedLanguage = Notification.Name("changedLanguage")

    private init() {}
    
    var language: Language {
        get {
            guard let languageString = UserDefaults.standard.string(forKey: "language") else {
                return .english
            }
            return Language(rawValue: languageString) ?? .english
        } set {
            if newValue != language {
                UserDefaults.standard.setValue(newValue.rawValue, forKey: "language")
                NotificationCenter.default.post(name: LocalizationService.changedLanguage, object: nil)
            }
        }
    }
}

