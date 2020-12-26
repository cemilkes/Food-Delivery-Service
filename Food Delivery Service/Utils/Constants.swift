//
//  Constants.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/19/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation

//IDs and Keys
public let kFILEREFERENCE = "gs://banh-thai.appspot.com/"

//Firebase
public let kUSER_PATH = "User"
public let kCATEGORY_PATH = "Category"
public let kITEMS_PATH = "Items"
public let kBASKET_PATH = "Basket"

//Category
public let kNAME = "name"
public let kIMAGE_NAME = "imageName"
public let kCID = "categoryId"

//
public let kOBJECTID = "objectId"
public let kDESCRIPTION = "description"
public let kPRICE = "price"
public let kIMAGELINKS = "imageLinks"
public let kOWNERID = "ownerId"
public let kITEMID = "itemId"
public let kQUANTITY = "quantity"
public let kSPECIALINSTRUCTIONS = "special_instruction"
public let kORDERITEMIDs = "Order_Item_Ids"

public let kEMAIL = "email"
public let kFIRSTNAME = "firstName"
public let kLASTNAME = "lastName"
public let kFULLNAME = "fullName"
public let kCURRENTUSER = "currentUser"
public let kFULLADDRESS = "fullAddress"
public let kONBOARD  = "onBoard"
public let kPURCHASEDITEMIDS = "purchasedItemIds"
public let kCREATEDAT = "Created At"


//StoryBoards

struct Storyboard {
    static let main = "Main"
    static let authentication = "Authentication"
    static let menu = "Menu"
}

// Controllers

struct ViewController {
    static let tabbarController     = "TabbarController"
    static let welcomeController    = "WelcomeController"
    static let loginController      = "LoginController"
    static let signUpController     = "SignUpController"
    static let forgotPasswordController = "ForgotPasswordController"
    static let menuController       = "MenuController"
    static let itemController       = "ItemsController"
    static let itemDetailController = "ItemDetailController"
}

struct PerformSegue {
    static let menuIdentifier = "menuIdentifier"
    static let itemToAddItem  = "ItemToAddItemSegue"
}
