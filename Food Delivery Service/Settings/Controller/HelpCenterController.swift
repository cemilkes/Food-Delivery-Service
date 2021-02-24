//
//  HelpCenterController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 2/18/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import UIKit
import JGProgressHUD

class HelpCenterController: UIViewController {

    @IBOutlet weak var topicTextField: BTTextfield!
    @IBOutlet weak var detailTextView: UITextView!
    let hud = JGProgressHUD(style: .dark)
    var feedBack:Feedback!

    override func viewDidLoad() {
        super.viewDidLoad()
        setSendButtonToolBar()
        configureTextView()
        // Do any additional setup after loading the view.
        
    }
    
    func setSendButtonToolBar(){
        let bar = UIToolbar()
        let send = UIBarButtonItem(title: "Send", style: .plain, target: self, action: #selector(sendButtonPressed))
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
        bar.items = [cancel, send]
        bar.sizeToFit()
        topicTextField.inputAccessoryView = bar
        detailTextView.inputAccessoryView = bar
    }

    func configureTextView(){
        detailTextView.layer.borderColor = UIColor.lightGray.cgColor
        detailTextView.layer.borderWidth = 1.0
        
    }
    
    @objc func sendButtonPressed(){
        if detailTextView.text == "" || topicTextField.text == "" {
                print("Can't be empty")
        }else{
                sendFeedback()
        }
    }
    
    @objc func cancelButtonPressed(){
        print("Cancel Button pressed")
        view.endEditing(true)
    }
    
    private func sendFeedback(){
        
        if MUser.currentUser() != nil {
            let currentUser = MUser.currentUser()!
            //print(currentUser.email)
            let feedback = Feedback()
            feedback.id = UUID().uuidString
            feedback.userId = currentUser.objectId
            feedback.email = currentUser.email
            feedback.topic = topicTextField.text
            feedback.detail = detailTextView.text
            Food_Delivery_Service.saveItemToFirebase(feedback)
        }
        showHUDSuccessMessage(text: "Your message has been sent! Thank you for your feedback.", hud: self.hud, view: self.view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            //print("Async after 2 seconds")
            self.popTheView()
        }
        
    }
//    @objc func dismissKeyboard(){
//     //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
//     //In short- Dismiss the active keyboard.
//     view.endEditing(true)
//     }
    
    
    //MARK: - Pop the View
    private func popTheView(){
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
