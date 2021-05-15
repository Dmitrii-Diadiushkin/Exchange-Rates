//
//  CurrencyRates.swift
//  Exchange Rates
//
//  Created by Dmitrii Diadiushkin on 15.05.2021.
//

import Foundation

struct CurrencyRates: Codable {
    let code: Int
    let messageTitle: String
    let message: String
    let rid: String
    let downloadDate: String
    let rates: [Rate]
    let productState: Int
    let ratesDate: String
}
