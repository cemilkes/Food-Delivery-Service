//
//  ItemsController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 9/25/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class ItemsController: UIViewController {

    // MARK: - Variables
    var category: Category?
    var itemArray : [Item] = []
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = category?.name
        
        //print("We have selected\(category?.name)")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if category != nil {
            loadItems()
        }
        
    }
    
    //MARK: - Load Items
    private func loadItems(){
        
        downloadItemsFromFirebase(category!.id, completion: { (allItems) in
            
            print("We have \(allItems.count) items for this category.")
            self.itemArray = allItems
            self.tableView.reloadData()
        })
        
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == PerformSegue.itemToAddItem {
        
            // Get the new view controller using segue.destination.
            let vc = segue.destination as! AddItemController
        
            // Pass the selected object to the new view controller.
            vc.category = category
        }
        
    }
    

}
