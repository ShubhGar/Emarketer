//
//  CartsViewController.swift
//  Emarketer
//
//  Created by shubham Garg on 15/07/20.
//  Copyright © 2020 shubham Garg. All rights reserved.
//

import UIKit

class CartsViewController: UIViewController {
    
    @IBOutlet weak var totalPriceLbl: UILabel!
    @IBOutlet weak var productsTableView: UITableView!
    var products:[ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsTableView.delegate = self
        productsTableView.dataSource = self
        productsTableView.tableFooterView = UIView(frame: .zero)
        self.title = "Cart"
        getProductData()
    }
    
    func getProductData(){
        products = carts
        var amount = 0
        for product in products{
            amount += Int(product.price.replacingOccurrences(of: ",", with: "")) ?? 0
        }
        self.totalPriceLbl.text = "₹ \(amount)"
        productsTableView.reloadData()
    }
    
    @IBAction func nxtBtnAxn(_ sender: Any) {
        if !products.isEmpty{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: AddressViewController.self))  as! AddressViewController
            vc.products = products
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            let alert = UIAlertController(title: nil, message: "Please add Some items in cart.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func buyMoreBtnAxn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: ProductsViewController.self))  as! ProductsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension CartsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTableViewCell.self), for: indexPath) as! ProductTableViewCell
        let product = products[indexPath.row]
        cell.productNameLbl.text = product.name
        cell.productPriceLbl.text = product.price
        cell.productImageView.image = UIImage(named: product.imageURl)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: ProductDetailViewController.self))  as! ProductDetailViewController
        vc.product = product
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
