//
//  MessagesViewController.swift
//  ShareContacts MessagesExtension
//
//  Created by Dave Jha on 6/9/18.
//  Copyright © 2018 Dave Jha. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController, AddMessageViewControllerDelegate {
    
    func presentViewController(for conversation: MSConversation, with presentationStyle: MSMessagesAppPresentationStyle) {
        

        let controller: UIViewController
            
        if presentationStyle == .compact {
            // TODO: Check if shared contacts is in the conversation
            controller = instantiateAddMessageViewController()
        }
        
        
        
       
       // Attach the new controller
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
    
    extension MessagesViewController: AddMessageViewControllerDelegate {
        func createSharedContactsButtonTapped(_ controller: AddMessageViewController)
    }
    
    
    
    
    
    
    
    
    
    
    /*
    func addMessageViewControllerDidSubmit(image: UIImage, caption: String) {
        let components = NSURLComponents()
        let layout = MSMessageTemplateLayout()
        layout.caption = caption
        layout.image = image
        
        let message = MSMessage()
        message.url = components.url!
        message.layout = layout
        
        self.activeConversation?.insert(message, completionHandler: { (error: NSError?) in
            
            } as? (Error?) -> Void)
    }
    
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    func instantiateAddMessageViewController() -> UIViewController {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "MessageDetailsViewController") as? MessageDetailsViewController else {
            fatalError("MessageDetailsViewController not found")
        }
        return controller
    }
    
    func instantiateMessageDetailsViewController() -> UIViewController {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "AddMessageViewController") as? AddMessageViewController else {
            fatalError("AddMessageViewController not found")
        }
        controller.delegate = self
        return controller
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        // Use this method to configure the extension and restore previously stored state.
        super.willBecomeActive(with: conversation)
        
        presentViewController(for: conversation, with: presentationStyle)
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
        
        // Use this method to prepare for the change in presentation style.
        super.willTransition(to: presentationStyle)
        
        // Hide child view controllers during the transition.
        removeAllChildViewControllers()
        
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
        super.didTransition(to: presentationStyle)
        
        // Present the view controller appropriate for the conversation and presentation style.
        guard let conversation = activeConversation else { fatalError("Expected an active converstation") }
        presentViewController(for: conversation, with: presentationStyle)
    }

}
