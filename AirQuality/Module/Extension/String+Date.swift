//
//  String+Date.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 11.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//
import Foundation

extension String {

    var date: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: self)
    }

}

extension Date {
    var string: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        return dateFormatter.string(from: self)
    }
}
