//
//  AirQualityViewModel.swift
//  AirQuality
//
//  Created by Arek Pituła on 09.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation

class AirQualityViewModel {
    fileprivate let stationRouter = StationRouter()
    
    init() {
        getAllStation()
    }
}

private extension AirQualityViewModel {
    func getAllStation() -> [Station] {
        let request = AllStationRequest()
        stationRouter.execute(request: request) { (result: Response<[Station]>) in
            print(result.value)
        }
        return []
    }
}
