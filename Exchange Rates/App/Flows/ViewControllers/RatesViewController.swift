//
//  RatesViewController.swift
//  Exchange Rates
//
//  Created by Dmitrii Diadiushkin on 13.05.2021.
//

import UIKit

class RatesViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RateTableViewCell", bundle: nil), forCellReuseIdentifier: "RateCell")
    }

}

extension RatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateCell", for: indexPath) as! RateTableViewCell
        return cell
    }
    
    
}

extension RatesViewController: UITableViewDelegate {
    
}
