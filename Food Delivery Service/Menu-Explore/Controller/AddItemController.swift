//
//  AddItemController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/3/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class AddItemController: UIViewController {

    
    @IBOutlet weak var addItemTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var category: Category!
    var itemImages: [UIImage?] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(category.id)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func DoneButtonPressed(_ sender: UIBarButtonItem) {
    
        dismissKeyboard()
        if fieldAreCompleted() {
            saveItemToFirebase()
        }else{
            //TODO: - Description
        }
        
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        dismissKeyboard()
    }
    
    private func fieldAreCompleted() -> Bool {
        return (addItemTextField.text != nil && priceTextField.text != nil)
    }
    
    private func dismissKeyboard(){
        self.view.endEditing(false)
    }
    
    private func popTheView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Save Item
    private func saveItemToFirebase(){
        let item         = Item()
        item.id          = UUID().uuidString
        item.name        = addItemTextField.text!
        item.categoryId  = category.id
        item.description = descriptionTextView.text
        item.price       = Double(priceTextField.text!)
    
        if itemImages.count > 0 {
            
        }else{
            Food_Delivery_Service.saveItemToFirebase(item)
            popTheView()
        }
   
    }
    
    
}