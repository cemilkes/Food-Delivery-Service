//
//  OrderHistoryController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 12/30/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class OrderHistoryController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    //var profileArray = [ProfileModel]()
    //var orderArray = [Any]()
    var orderedItems: [OrderItem] = []
    var item: Item?
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("Order History Controller Loaded")
        setupUI()
        loadOrder()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

       // print("Order View Controller Will Appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

       // print("Order View Controller Will Disappear")
    }
    
    private func setupUI(){
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    private func loadItemFrom(orderItems: OrderItem){
        
        item?.id = orderItems.itemId
        FirebaseReference(.Items).document((item?.id)!).getDocument { (snapshot, error) in
            guard let snapshot = snapshot else {
                return
            }
            if snapshot.exists {
                print(self.item?.name)
                print(self.item?.price)
            }else {
                
            }
        }
        
    }
    
    private func loadOrder(){
        downloadOrderItems(MUser.currentUser()!.purchasedItemIds) { (allOrder) in
            self.orderedItems = allOrder
            
            self.tableView.reloadData()
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
