//
//  UIView+UINib.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 11.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
