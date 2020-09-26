//
//  Constants.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/19/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation



//Firebase
public let kUSER_PATH = "User"
public let kCATEGORY_PATH = "Category"
public let kITEMS_PATH = "Items"
public let kBASKET_PATH = "Basket"

//Category
public let kNAME = "name"
public let kIMAGE_NAME = "imageName"
public let kCID = "categoryId"


//StoryBoards

struct Storyboard {
    static let main = "Main"
    static let authentication = "Authentication"
}

// Controllers

struct ViewController {
    static let welcomeController = "WelcomeController"
    static let loginController   = "LoginController"
    static let menuController   = "MenuController"
    static let itemController   = "ItemsController"
}
