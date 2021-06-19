//
//  ContainerContrller.swift
//  SideMenu
//
//  Created by Quang Nguyen on 1/5/21.
//

import UIKit

class ContainerController : UIViewController {
    
    // MARK: - Properties
    
    var menuController: MenuController!
    var centerController : UIViewController!
    var isExpanded = false
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    // MARK: - Handlers
    
    func configureHomeController() {
        let homeController  = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)

    }
    
    func configureMenuController() {
        if menuController == nil {
            // tao menu controller
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func animatePanel(shouldExpland: Bool, menuOption : MenuOption?) {
        if shouldExpland {
            //show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 120
                
            }, completion: nil)

        } else {
            // hide mune
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.centerController.view.frame.origin.x = 0
            } completion: { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        animateSatusbar()
    }
    
    func didSelectMenuOption(menuOption : MenuOption) {
        switch menuOption {
        
        case .Profile:
            print("Profile")
        case .Inbox:
            print("Inbox")
        case .Notification:
            print("Noti")
        case .Settings:
            print("Settings")
            // root viewcontroller bằng UINavigationcontroller và present fullScreen
            let controller = SettingsController()
            controller.username  = "Spider Man"
            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion:  nil)
        }
    }
    
    func animateSatusbar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsUpdateOfScreenEdgesDeferringSystemGestures()
        }, completion: nil)
    }
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpland: isExpanded, menuOption: menuOption)
    }
}

