//
//  StartViewController.swift
//  Exchange Rates
//
//  Created by Dmitrii Diadiushkin on 13.05.2021.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet private weak var getRatesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func setup() {
        getRatesButton.layer.cornerRadius = 10
    }

}
