//
//  ProductsViewController.swift
//  Emarketer
//
//  Created by shubham Garg on 15/07/20.
//  Copyright © 2020 shubham Garg. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    @IBOutlet weak var productTableView: UITableView!
    var products:[ProductModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.tableFooterView = UIView(frame: .zero)
        self.title = "Emarketer"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cart", style: .done, target: self, action: #selector(openCart))
        self.navigationController?.navigationBar.tintColor = UIColor.blue
        getProductData()
    }
    
    func getProductData(){
        products = productList
        productTableView.reloadData()
    }
    
    @objc func openCart(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: CartsViewController.self))  as! CartsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTableViewCell.self), for: indexPath) as! ProductTableViewCell
        let product = products[indexPath.row]
        cell.productNameLbl.text = product.name
        cell.productPriceLbl.text = "₹ " + product.price
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
