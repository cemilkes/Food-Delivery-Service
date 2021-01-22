//
//  SearchItemController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/21/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SearchItemController: UIViewController {

    @IBOutlet weak var searchOptionView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButtonOutlet: UIButton!
    
    var searchResults: [Item] = []
    
    var activityIndicator: NVActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        searchTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let width = self.view.frame.width
        let heigth = self.view.frame.height
        activityIndicator = NVActivityIndicatorView(frame: CGRect(x: width/2 - 30, y: heigth/2 - 30, width: 60.0, height: 60.0), type: .ballPulse, color: .brown, padding: nil)
    }
    
    func configTableView(){
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func showSearchBarButtonPressed(_ sender: Any) {
        dismissKeyboard()
        showSearchField()
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
    }
    
    // MARK: - Helper
    private func emptyTextField(){
        searchTextField.text = ""
    }
    private func dismissKeyboard(){
        self.view.endEditing(false)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        print("typing")
        searchButtonOutlet.isEnabled = textField.text != ""
        if searchButtonOutlet.isEnabled {
            searchButtonOutlet.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }else{
            
        }
    }
    
    private func disableSearchButton(){
        searchButtonOutlet.isEnabled = false
        searchButtonOutlet.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    private func showSearchField(){
        disableSearchButton()
        emptyTextField()
        animateSearchOptionIn()
    }
    
    private func animateSearchOptionIn(){
        
        UIView.animate(withDuration: 0.5, animations: {
            self.searchOptionView.isHidden = !self.searchOptionView.isHidden
        })
        
    }
    
    private func showLoadingIndicator(){
        if activityIndicator != nil {
            self.view.addSubview(activityIndicator!)
            activityIndicator?.startAnimating()
        }
    }
    private func hideLoadingIndicator(){
        if activityIndicator != nil {
            activityIndicator?.removeFromSuperview()
            activityIndicator?.stopAnimating()
        }
    }
    
    public func showItemView(withItem: Item){
        let itemVC = UIStoryboard.init(name: Storyboard.authentication, bundle: nil).instantiateViewController(identifier: ViewController.itemDetailController) as! ItemDetailController
        itemVC.item = withItem
        self.navigationController?.pushViewController(itemVC, animated: true)
    
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
