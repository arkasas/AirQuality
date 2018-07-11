//
//  AirQualityModel.swift
//  AirQuality
//
//  Created by Arek Pituła on 10.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation

class AirQualityModel {
    var name: String
    var code: String

    var calcDate: DateType
    var indexLevel: IndexLevel?
    var sourceDataDate: String?

    init(name: String, code: String, calcDate: DateType, indexLevel: IndexLevel? = nil, sourceDataDate: String? = nil) {
        self.name = name
        self.code = code
        self.calcDate = calcDate
        self.indexLevel = indexLevel
        self.sourceDataDate = sourceDataDate
    }

    func isValid() -> Bool {
        return indexLevel != nil
    }
}
