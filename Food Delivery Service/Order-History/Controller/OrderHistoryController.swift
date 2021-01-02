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
    var profileArray = [ProfileModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Order Controller Loaded")
        setupUI()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print("Order View Controller Will Appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        print("Order View Controller Will Disappear")
    }
    
    private func setupUI(){
//        tableView.delegate = self
//        tableView.dataSource = self
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
