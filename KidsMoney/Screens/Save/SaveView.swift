//
//  SaveView.swift
//  KidsMoney
//
//  Created by Christian Elijah on 2020-09-25.
//

import UIKit

protocol AddSavings {
    func addSaving(price: String)
}

class SaveView: UIViewController {

    @IBOutlet var saveButton: UIButton!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var helpButton: UIButton!
    
    var delegate: AddSavings?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        styling()
        
    }
    func styling() {
        saveButton.layer.cornerRadius = 15
        saveButton.layer.shadowColor = UIColor.black.cgColor
        saveButton.layer.shadowOffset = .zero
        saveButton.layer.shadowRadius = 8
        saveButton.layer.shadowOpacity = 0.3
        
        helpButton.layer.cornerRadius = 15
        helpButton.layer.shadowColor = UIColor.black.cgColor
        helpButton.layer.shadowOffset = .zero
        helpButton.layer.shadowRadius = 8
        helpButton.layer.shadowOpacity = 0.3
    }
    @IBAction func goBack(_ sender: Any) {
        if priceTextField.text != "" {
            delegate?.addSaving(price: priceTextField.text!)
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
