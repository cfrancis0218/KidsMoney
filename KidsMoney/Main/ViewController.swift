//
//  ViewController.swift
//  KidsMoney
//
//  Created by Christian Elijah on 2020-09-23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddSavings {
    
    @IBOutlet var pricesTableView: UITableView!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var barView: UIView!
    @IBOutlet var safeSwitch: UISwitch!
    
    var prices: [Prices] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styling()
        
        self.pricesTableView.delegate = self
        self.pricesTableView.dataSource = self
    }
    
    func addSaving(price: String) {
        prices.append(Prices(price: price))
        pricesTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SaveView
        vc.delegate = self
    }
    
    func styling() {
        saveButton.layer.cornerRadius = 10
        saveButton.layer.shadowColor = UIColor.black.cgColor
        saveButton.layer.shadowOpacity = 0.3
        saveButton.layer.shadowOffset = .zero
        saveButton.layer.shadowRadius = 10
        
        barView.layer.cornerRadius = 10
        barView.layer.shadowColor = UIColor.black.cgColor
        barView.layer.shadowOpacity = 0.3
        barView.layer.shadowOffset = .zero
        barView.layer.shadowRadius = 10
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        if safeSwitch.isOn {
            return nil
        } else {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
                self.prices.remove(at: indexPath.row)
                self.pricesTableView.deleteRows(at: [indexPath], with: .automatic)
                complete(true)
            }
            
            deleteAction.backgroundColor = UIColor.systemPink
            
            let config = UISwipeActionsConfiguration(actions: [deleteAction])
            config.performsFirstActionWithFullSwipe = true
            return config
        }
    }

    @IBAction func safeModeActivated(_ sender: Any) {
        if safeSwitch.isOn {
            let alertController = UIAlertController(title: "Safe Mode Activated", message: "", preferredStyle: .actionSheet)
            let closeAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
            alertController.addAction(closeAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Safe Mode Deactivated", message: "", preferredStyle: .actionSheet)
            let closeAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
            alertController.addAction(closeAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pricesTableView.dequeueReusableCell(withIdentifier: "pricesCell", for: indexPath) as! PriceCell
        cell.priceLabel.text = prices[indexPath.row].price
        cell.indexPosition = indexPath.row
        cell.prices = prices
        return cell
    }
}

