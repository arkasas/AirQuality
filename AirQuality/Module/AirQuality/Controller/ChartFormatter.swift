//
//  ChartFormatter.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 11.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Charts
import Foundation

class ChartXAxisFormatter: NSObject {
    fileprivate var dateFormatter: DateFormatter!
    
    override init() {
        super.init()
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        dateFormatter.locale = Locale.current
    }
}

extension ChartXAxisFormatter: IAxisValueFormatter {

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let date = Date(timeIntervalSince1970: value)
        return dateFormatter.string(from: date)
    }

}

