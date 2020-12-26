//
//  ProductDetailViewController.swift
//  Emarketer
//
//  Created by shubham Garg on 15/07/20.
//  Copyright © 2020 shubham Garg. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var prductDetailLbl: UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet var productNameLbl: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    var product: ProductModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        prductDetailLbl.text = product?.description
        productPriceLbl.text = "₹ " + (product?.price ?? "")
        productNameLbl.text = product?.name
        productImageView.image = UIImage(named: product?.imageURl ?? "")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cart", style: .done, target: self, action: #selector(openCart))
        self.navigationController?.navigationBar.tintColor = UIColor.blue
    }
    
    @objc func openCart(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: CartsViewController.self))  as! CartsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func buyNowBtnAxn(_ sender: Any) {
        if let product = self.product{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: AddressViewController.self))  as! AddressViewController
            vc.products.append(product)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func addToCartBtnAxn(_ sender: Any) {
        if let product = self.product{
            if carts.contains(where: { (model) -> Bool in
                return model == product
            }){
                let alert = UIAlertController(title: nil, message: "Product is already in Cart, You want to add more.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                    carts.append(product)
                }))
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                carts.append(product)
            }
            
            
        }
        
    }
    
    
}
