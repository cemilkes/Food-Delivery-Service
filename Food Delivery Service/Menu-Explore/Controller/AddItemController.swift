//
//  AddItemController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/3/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit
import Gallery
import NVActivityIndicatorView


class AddItemController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var addItemTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    //MARK: - Variables
    var category: Category!
    
    //create an array for item images and initialize it as empty.
    var itemImages: [UIImage?] = []
    var gallery: GalleryController!
    var activityIndicator: NVActivityIndicatorView?
    
//    var selectedCurrency: Currency? {
//           didSet {
//            priceTextField.text?.removeAll()
//            priceTextField.currency = selectedCurrency
//            //priceTextField.becomeFirstResponder()
//           }
//       }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(category.id)
        // Do any additional setup after loading the view.
        //setCurrencyOnStart()s
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        activityIndicator = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.width / 2 - 30, y: self.view.frame.height / 2 - 30, width: 60, height: 60), type: .ballClipRotate, color: .black, padding: nil)
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
    
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
        itemImages = []
        showImageGallery()
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        dismissKeyboard()
    }
    
    
    private func fieldAreCompleted() -> Bool {
        return (addItemTextField.text != nil && priceTextField.text != nil)
    }
    
    //MARK: - Dismiss Keyboard
    private func dismissKeyboard(){
        self.view.endEditing(false)
    }
    
    //MARK: - Pop the View
    private func popTheView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Save Item
    private func saveItemToFirebase(){
        showLoadingIndicator()
        let item         = Item()
        item.id          = UUID().uuidString
        item.name        = addItemTextField.text!
        item.categoryId  = category.id
        item.description = descriptionTextView.text
        item.price       = Double(priceTextField.text!)  // Double(priceTextField.text)!
        
        if itemImages.count > 0 {
            
            uploadImages(images: itemImages, itemId: item.id) { (imageLinkArray) in
                item.imageLinks = imageLinkArray
                Food_Delivery_Service.saveItemToFirebase(item)
                self.hideLoadingIndicator()
                self.popTheView()
            }
        }else{
            Food_Delivery_Service.saveItemToFirebase(item)
            popTheView()
        }
    }
    
    //MARK: - Activity Indicator
    private func showLoadingIndicator(){
        if activityIndicator != nil{
            self.view.addSubview(activityIndicator!)
            activityIndicator!.startAnimating()
        }
    }
    
    private func hideLoadingIndicator(){
        if activityIndicator != nil {
            activityIndicator!.removeFromSuperview()
            activityIndicator?.stopAnimating()
        }
    }
    //MARK: - Set Local Currency
    
//    private func setCurrencyOnStart() {
//            selectedCurrency = Currency(locale: "en_US", amount: 0.0)
//        }
    
    //MARK: - Show Image Gallery
    private func showImageGallery(){
        
        self.gallery = GalleryController()
        self.gallery.delegate = self
        
        Config.tabsToShow = [.imageTab, .cameraTab]
        Config.Camera.imageLimit = 2
        
        self.present(self.gallery, animated: true, completion: nil)
    }
    
    
}

