//
//  PaymentViewController.swift
//  Emarketer
//
//  Created by shubham Garg on 15/07/20.
//  Copyright © 2020 shubham Garg. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var totalPriceLabel: UILabel!
    var products:[ProductModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Payment"
        var amount = 0
        for product in products{
            let priceString = product.price.replacingOccurrences(of: ",", with: "")
            let price = Int(priceString)
            amount += price ?? 0
        }
        self.totalPriceLabel.text = "₹ \(amount)"
    }
    
    @IBAction func cashPaymentAxn(_ sender: Any) {
        print(address)
        carts.removeAll()
        let alert = UIAlertController(title: nil, message: "Your order is Done. Thanks for using Emarketer.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler:{
          (action) in
            self.navigationController?.popToRootViewController(animated: true)
        }  ))
        self.present(alert, animated: true, completion: nil)
    }

}
