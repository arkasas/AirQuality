//
//  StationCellModel.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 10.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation

class StationCellModel {
    let station: Station
    var isSelected = false

    init(station: Station) {
        self.station = station
    }
}
