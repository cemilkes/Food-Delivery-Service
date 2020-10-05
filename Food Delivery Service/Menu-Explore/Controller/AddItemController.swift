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
    
    @IBOutlet weak var priceTextField: CurrencyTextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var category: Category!
    var itemImages: [UIImage?] = []
    
    var selectedCurrency: Currency? {
           didSet {
            priceTextField.text?.removeAll()
            priceTextField.currency = selectedCurrency
            //priceTextField.becomeFirstResponder()
           }
       }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(category.id)
        // Do any additional setup after loading the view.
        setCurrencyOnStart()
        priceTextField.currency = selectedCurrency
                //Pass amount from CurrencyTextField class
//        priceTextField.passTextFieldText = { [weak self] enteredStringAmount, amountAsDouble in
//                    self?.cleanAmtLbl.text = String(amountAsDouble ?? 0.0)
//                }
        
    }
    
    @IBAction func DoneButtonPressed(_ sender: UIBarButtonItem) {
    
        dismissKeyboard()
        if fieldAreCompleted() {
            saveItemToFirebase()
        }else{
            //TODO: - Description
            print("Item not added")
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
        item.price       = priceTextField.text!
    
        if itemImages.count > 0 {
            
        }else{
            Food_Delivery_Service.saveItemToFirebase(item)
            popTheView()
        }
   
    }
    
    private func setCurrencyOnStart() {
            selectedCurrency = Currency(locale: "en_US", amount: 0.0)
        }
    
}
