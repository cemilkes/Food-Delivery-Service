//
//  AddItemController+Gallery.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 12/25/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import Gallery

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
