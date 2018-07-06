//
//  MessagesViewController.swift
//  ShareContacts MessagesExtension
//
//  Created by Dave Jha on 6/9/18.
//  Copyright © 2018 Dave Jha. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    override func didBecomeActive(with conversation: MSConversation) {
        super.didBecomeActive(with: conversation)
        presentChildViewController()
        
    }
    
    func presentChildViewController() {
        
        let controller = UIViewController()//instantiateAddMessageViewController()
        
        addChildViewController(controller)
        
        controller.view.frame = view.bounds
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        
        controller.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        controller.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        controller.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        controller.didMove(toParentViewController: self)
        
        
    }
    
    extension MessagesViewController: 
    

}
