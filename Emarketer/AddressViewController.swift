//
//  AddressViewController.swift
//  Emarketer
//
//  Created by shubham Garg on 15/07/20.
//  Copyright © 2020 shubham Garg. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
    @IBOutlet weak var addressTextview: UITextView!
    var products:[ProductModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        addressTextview.text = address
        self.title = "Add Address"
        addressTextview.layer.borderColor = UIColor.gray.cgColor
        addressTextview.layer.borderWidth = 1
    }


    @IBAction func nextBtnAxn(_ sender: Any) {
        if !addressTextview.text.isEmpty{
            address = addressTextview.text
            let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: PaymentViewController.self))  as! PaymentViewController
            vc.products = products
                   self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            let alert = UIAlertController(title: nil, message: "Please add Address.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
