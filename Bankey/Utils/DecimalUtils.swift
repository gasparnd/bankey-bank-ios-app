//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Gaspar Dolcemascolo on 27/11/2024.
//

import Foundation

extension Decimal {
    var doubleValues: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
