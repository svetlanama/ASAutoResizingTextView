//
//  ViewController.swift
//  ASAutoResizingTextView
//
//  Created by Svitlana Moiseyenko and Alexander Vasileyko on 2/4/16.
//  Copyright © 2016 Svitlana Moiseyenko and Alexander Vasileyko. All rights reserved.
//

import UIKit
import ASAutoResizingTextView

class ViewController: UIViewController {
  
  @IBOutlet weak var sendBar: UIView!
  @IBOutlet weak var sendButton: UIButton!
  @IBOutlet weak var sendTextView: ASAutoResizingTextView!
  @IBOutlet weak var bottomSpacingConstraint: NSLayoutConstraint!
  @IBOutlet weak var sendTextViewHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var sendBarHeightConstraint: NSLayoutConstraint!
  
  var diffConstant: CGFloat = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(patternImage: UIImage(named: "msg.jpg")!)
    initSendBar()
  }
  
  
  fileprivate func initSendBar() {
    
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
    
    diffConstant = sendBarHeightConstraint.constant - sendTextViewHeightConstraint.constant
    sendTextView.autoresizeTextViewDelegate = self
    sendButton.addTarget(self, action: #selector(ViewController.sendMessage(_:)), for: UIControlEvents.touchUpInside)
  }
  
  //MARK: Keyboard Delegate
  func keyboardWillHide(_ notification: Notification) {
    guard let _ = notification.userInfo else {
      return
    }
    
    UIView.animate(withDuration: 0.1, animations: { () -> Void in
      self.bottomSpacingConstraint.constant = 0
      self.view.layoutIfNeeded()
    })
  }
  
  func keyboardWillShow(_ notification: Notification) {
    
    guard let userInfo = notification.userInfo else {
      return
    }
    
    let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    UIView.animate(withDuration: 0.1, animations: {
      () -> Void in
      
      
      self.bottomSpacingConstraint.constant = keyboardSize.height
      self.view.layoutIfNeeded()
    })
  }
  
  //MARK: Actions
  func sendMessage(_ sender: AnyObject) {
    
    sendTextView.resignFirstResponder()
    sendTextView.text = ""
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

extension ViewController: ASAutoResizingTextViewDelegate {
  
  func didAutolayoutContraintChanged(_ constantHeight: CGFloat) {
    sendBarHeightConstraint.constant = constantHeight + 20
  }
}

