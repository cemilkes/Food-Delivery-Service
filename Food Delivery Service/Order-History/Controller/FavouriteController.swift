//
//  FavouriteController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 12/28/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class FavouriteController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .red
        // Do any additional setup after loading the view.
        setupUI()
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
