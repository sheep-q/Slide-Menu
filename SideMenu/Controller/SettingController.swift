//
//  SettingController.swift
//  SideMenu
//
//  Created by Quang Nguyen on 1/30/21.
//

import Foundation
import UIKit

class SettingsController : UIViewController {
    
    // MARK: - Properties
    var username : String?
    
    // MARK: - Init
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        if let username = username {
            print ("User name is : \(username)")
        } else {
            print("User name is not found ")
        }
    }
    
    // MARK: - Handler
    
    @objc func handleDismiss(){
        dismiss(animated: true, completion: nil)
    }
    
    func configureUI() {
        view.backgroundColor = .systemTeal
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Settings"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "exit").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
    }
}
