//
//  UITableView+Extension.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/6/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
    
    func setEmptyView(title: String, message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))

        let titleLabel = UILabel()
        let messageLabel = UILabel()
        let imageName = "emptyCardImage.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "Avenir-Heavy", size: 24)
        
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "Avenir-Roman", size: 17)
        
        
        //tableView.addSubview(emptyView)
        emptyView.addSubview(imageView)
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        
        imageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        //imageView.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        //imageView.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        
        
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true

        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
       
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        UIView.animate(withDuration: 1, animations: {
            imageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
        }, completion: { (finish) in
            UIView.animate(withDuration: 1, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
            }, completion: { (finishh) in
                UIView.animate(withDuration: 1, animations: {
                    imageView.transform = CGAffineTransform.identity
                })
            })
        })
        
        // The only tricky part is here:
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
    
    
    
    
}
