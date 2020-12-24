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
    
    @IBOutlet weak var priceTextField: CurrencyTextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    //MARK: - Variables
    var category: Category!
    
    //create an array for item images and initialize it as empty.
    var itemImages: [UIImage?] = []
    var gallery: GalleryController!
    var activityIndicator: NVActivityIndicatorView?
    
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
        item.price       = priceTextField.text!  // Double(priceTextField.text)!
        
        if itemImages.count > 0 {
            
        }else{
            Food_Delivery_Service.saveItemToFirebase(item)
            popTheView()
        }
   
    }
    
    //MARK: - Set Local Currency
    
    private func setCurrencyOnStart() {
            selectedCurrency = Currency(locale: "en_US", amount: 0.0)
        }
    
    //MARK: - Show Image Gallery
    private func showImageGallery(){
        
        self.gallery = GalleryController()
        self.gallery.delegate = self
        
        Config.tabsToShow = [.imageTab, .cameraTab]
        Config.Camera.imageLimit = 2
        
        self.present(self.gallery, animated: true, completion: nil)
    }
    
    
}

extension AddItemController: GalleryControllerDelegate{
    func galleryController(_ controller: GalleryController, didSelectImages images: [Image]) {
        
        if images.count > 0 {
            Image.resolve(images: images, completion: { (resolvedImages) in
                self.itemImages = resolvedImages
            })
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    func galleryController(_ controller: GalleryController, didSelectVideo video: Video) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func galleryController(_ controller: GalleryController, requestLightbox images: [Image]) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func galleryControllerDidCancel(_ controller: GalleryController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
        
    
    
    
    
}
