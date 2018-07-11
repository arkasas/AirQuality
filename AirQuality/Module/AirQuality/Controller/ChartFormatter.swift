//
//  ChartFormatter.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 11.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Charts

//class ChartXAxisFormatter: NSObject {
//    fileprivate var referenceTimeInterval: TimeInterval?
//
//    convenience init(referenceTimeInterval: TimeInterval) {
//        self.init()
//        self.referenceTimeInterval = referenceTimeInterval
//    }
//}
//
//
//extension ChartXAxisFormatter: IAxisValueFormatter {
//
//    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
//        guard let referenceTimeInterval = referenceTimeInterval else {
//            return ""
//        }
//
//        let date = Date(timeIntervalSince1970: value * 3600 * 24 + referenceTimeInterval)
//        return date.string
//    }
//
//}


class ChartXAxisFormatter: NSObject {
    var dateFormatter: DateFormatter?
}

extension ChartXAxisFormatter: IAxisValueFormatter {

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if let dateFormatter = dateFormatter {

            let date = Date(timeIntervalSince1970: value)
            return dateFormatter.string(from: date)
        }

        return ""
    }

}

