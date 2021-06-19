//
//  MenuOption.swift
//  SideMenu
//
//  Created by Quang Nguyen on 1/30/21.
//

import Foundation
import UIKit
enum MenuOption : Int, CustomStringConvertible {
    
    case Profile
    case Inbox
    case Notification
    case Settings
    
    var description: String {
        switch self {
        
        case .Profile:
            return "Profile"
        case .Inbox:
            return "Inbox"
        case .Notification:
            return "Notification"
        case .Settings:
            return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        
        case .Profile:
            return UIImage(named: "profile") ?? UIImage()
        case .Inbox:
            return UIImage(named: "inbox") ?? UIImage()
        case .Notification:
            return UIImage(named: "notification") ?? UIImage()
        case .Settings:
            return UIImage(named: "settings") ?? UIImage()
        }
    }

}
