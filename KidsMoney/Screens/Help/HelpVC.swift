//
//  HelpVC.swift
//  KidsMoney
//
//  Created by Christian Elijah on 2020-09-25.
//

import UIKit

class HelpVC: UIViewController {

    @IBOutlet var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        helpStyle()
    }
    func helpStyle() {
        backButton.layer.shadowColor = UIColor.black.cgColor
        backButton.layer.shadowOpacity = 0.3
        backButton.layer.shadowOffset = .zero
        backButton.layer.shadowRadius = 8
    }
}
