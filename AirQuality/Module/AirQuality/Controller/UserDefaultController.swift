//
//  UserDefaultController.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 10.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation

class UserDefaultController {

    private struct Key {
        static let station = "station"
    }

    static var station: Station? {
        get {
            if let data = UserDefaults.standard.value(forKey: Key.station) as? Data {
                return try? PropertyListDecoder().decode(Station.self, from: data)
            }
            return nil
        }
        set {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: Key.station)
        }
    }

}
