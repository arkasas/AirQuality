//
//  AqIndexRouter.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 10.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

class AqIndexRouter: Router {
    override var api: API! {
        get {
            return AirAPI()
        }
        set {

        }
    }

    override var path: String {
        get {
            return "aqindex/"
        }
        set {

        }
    }
}
