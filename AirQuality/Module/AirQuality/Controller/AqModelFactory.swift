//
//  AqModelFactory.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 11.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation

final class AqModelFactory {
    func generate(model: AqIndex, by type: AqType) -> AirQualityModel {
        switch type {
        case .no2:
            return AirQualityModel(name: "Dwutlenek azotu", code: "NO2", calcDate: model.no2CalcDate, indexLevel: model.no2IndexLevel, sourceDataDate: model.no2SourceDataDate)
        case .c6h6:
            return AirQualityModel(name: "Benzen", code: "C6H6", calcDate: model.c6h6CalcDate, indexLevel: model.c6h6IndexLevel, sourceDataDate: model.c6h6SourceDataDate)
        case .pm10:
            return AirQualityModel(name: "Pył zawieszony PM10", code: "PM10", calcDate: model.pm10CalcDate, indexLevel: model.pm10IndexLevel, sourceDataDate: model.pm10SourceDataDate)
        case .pm25:
            return AirQualityModel(name: "Pył zawieszony PM2.5", code: "PM2.5", calcDate: model.pm25CalcDate, indexLevel: model.pm25IndexLevel, sourceDataDate: model.pm25SourceDataDate)
        case .so2:
            return AirQualityModel(name: "Dwutlenek siarki", code: "SO2", calcDate: model.so2CalcDate, indexLevel: model.so2IndexLevel, sourceDataDate: model.so2SourceDataDate)
        case .o3:
            return AirQualityModel(name: "Ozon", code: "O3", calcDate: model.o3CalcDate, indexLevel: model.o3IndexLevel, sourceDataDate: model.o3SourceDataDate)
        }
    }

    func generateAllValidModel(model: AqIndex) -> [AirQualityModel] {
        var arr = [AirQualityModel]()
        AqType.allValues.forEach {
            let m = generate(model: model, by: $0)
            if m.isValid() {
                arr.append(generate(model: model, by: $0))
            }
        }

        return arr
    }
}
