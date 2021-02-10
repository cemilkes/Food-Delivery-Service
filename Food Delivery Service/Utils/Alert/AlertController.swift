//
//  AlertController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 2/9/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import UIKit

class AlertController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var actionButtonOutlet: BTButton!
    @IBOutlet weak var cancelButtonOutlet: UIButton!
    
    var image = String()
    var alertTitle = String()
    var alertDescription = String()
    var actionButtonTitle = String()
    var cancelButtonTitle = String()
    
    var didTapActionButton: (() -> Void)?
    var didTapCancelButton: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView(){
        imageView.image = UIImage(named: image)
        titleLabel.text = alertTitle
        descriptionLabel.text = alertDescription
        actionButtonOutlet.setTitle(actionButtonTitle, for: .normal)
        cancelButtonOutlet.setTitle(cancelButtonTitle, for: .normal)
    }

    @IBAction func didTapActionButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        didTapActionButton?()
    }
    
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        didTapCancelButton?()
    }
    
}
