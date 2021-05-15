//
//  RateTableViewCell.swift
//  Exchange Rates
//
//  Created by Dmitrii Diadiushkin on 13.05.2021.
//

import UIKit

class RateTableViewCell: UITableViewCell {

    @IBOutlet private weak var currencyName: UILabel!
    @IBOutlet private weak var exchangeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    func setupCell(rate: Rate) {
        
        let exchangeText = "\(rate.currMnemFrom.rawValue)(код \(rate.from)) / \(rate.currMnemTo)(код \(rate.to)) \(rate.basic) ед."
        let exchangeRates = "Продажа \(rate.sale) дельта \(rate.deltaSale)\nПокупка \(rate.buy) дельта \(rate.deltaBuy)"
        currencyName.text = rate.name
        exchangeLabel.text = exchangeText
        rateLabel.text = exchangeRates
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        currencyName.text = ""
        exchangeLabel.text = ""
        rateLabel.text = ""
    }
}
