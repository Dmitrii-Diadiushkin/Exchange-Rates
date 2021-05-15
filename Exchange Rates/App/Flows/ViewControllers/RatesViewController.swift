//
//  RatesViewController.swift
//  Exchange Rates
//
//  Created by Dmitrii Diadiushkin on 13.05.2021.
//

import UIKit

class RatesViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var currencyRates = [Rate]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        showRatesRequestResult()
    }
    
    @IBAction func updateRates(_ sender: UIBarButtonItem) {
        showRatesRequestResult()
    }
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RateTableViewCell", bundle: nil), forCellReuseIdentifier: "RateCell")
        self.tableView.rowHeight = 150.0
        tableView.isHidden = true
        self.view.backgroundColor = .systemGray2
    }
    
    private func showRatesRequestResult() {
        tableView.isHidden = true
        getDataToShow() { [weak self] result in
            guard let self = self else {return}
            switch result {
            case let .success(recivedRates):
                self.currencyRates = recivedRates
                self.tableView.isHidden = false
                self.tableView.reloadData()
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    private func getDataToShow(completion: ((Swift.Result<[Rate], Error>) -> Void)? = nil) {
        NetworkManager.shared.getRates() { result in
            switch result {
            case let .success(recivedData):
                DispatchQueue.main.async {
                    completion?(.success(recivedData.rates))
                }
            case let .failure(error):
                DispatchQueue.main.async {
                    print("Some error")
                    completion?(.failure(error))
                }
            }
        }
    }
}

extension RatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyRates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateCell", for: indexPath) as! RateTableViewCell
        cell.setupCell(rate: currencyRates[indexPath.row])
        return cell
    }
}

extension RatesViewController: UITableViewDelegate {
    
}
