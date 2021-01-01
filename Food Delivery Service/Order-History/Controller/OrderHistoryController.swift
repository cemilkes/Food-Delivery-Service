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
        //view.backgroundColor = .blue
        setupUI()
        // Do any additional setup after loading the view.
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
