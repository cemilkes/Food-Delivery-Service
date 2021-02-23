//
//  Constants.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/19/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation


enum Constats {
    
    static let publishableKey = "pk_test_51ICrbdL2PsSwsfWNpBYReAZR8AkkRQOIApydC6SqCR784MkOuzy4gA9InLP8fYBczocBvSzjpAzfDRjLPyl1bINY00TXMb9d32"
    static let baseURLString = "https://banh-thai.herokuapp.com/" //"http://localhost:3000/"
    static let defaultCurrency = "usd"
    static let defaultDescription = "Purchase from Banh Thai"
    static let yelpApiKey = "H6DwkC4tLyR4zl_38_BVchXi5l1iSf14gabfw3md_H5nY_a7Tj4urdvB8eozbRYELl5kNQz36x3yp_Gs-6sAX-6qMAmyqGxDseKGGXCxdo2F2g_qBRS1hqQwWOIcYHYx"
    static let clientID = "CaEN8TmVN4mChPau7JahXw"
    static let businessID = "XGprFc9iX7rlhXXU7g-ofQ"
}


//IDs and Keys
public let kFILEREFERENCE = "gs://banh-thai.appspot.com/"
public let kALGOLIA_APP_ID = "DA74EERBUJ"
public let KALGOLIA_SEARCH_KEY = "5f8f52310a798c8b0b868ca18d9d6030"
public let kALGOLIA_ADMIN_KEY = "68ab998a41b0b7f366482f06f4badecb"

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
public let kORDERITEMIDs = "order_Item_Ids"
public let kITEM = "item"
public let kORDERITEMTOTALAMOUNT = "order_Item_total"

public let kEMAIL = "email"
public let kUSERNAME = "userName"
public let kCURRENTUSER = "currentUser"
public let kADDRESS = "address"
public let kPHONENUMBER = "phone_number"
public let kONBOARD  = "onBoard"
public let kPURCHASEDITEMIDS = "purchasedItemIds"
public let kCREATEDAT = "created At"
public let kBIRTHDATE = "BirthDate"


//StoryBoards

struct Storyboard {
    static let main = "Main"
    static let authentication = "Authentication"
    static let menu = "Menu"
    static let settings = "Settings"
    static let order = "MyOrder"
    static let alert = "Alert"
    static let notifications = "Notifications"
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
    static let profileController = "ProfileController"
    static let addressController = "AddressController"
    static let phoneNumberController = "PhoneNumberController"
    static let notificationsController = "NotificationsController"
    static let alertController = "AlertController"
}

struct PerformSegue {
    static let menuIdentifier = "menuIdentifier"
    static let itemToAddItem  = "ItemToAddItemSegue"
    static let editProfile = "goToEditProfile"
    static let notifications = "goToNotifications"
    static let helpCenter = "goToHelpCenter"
}
