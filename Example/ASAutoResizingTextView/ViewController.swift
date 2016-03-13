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
  
  
  private func initSendBar() {
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    
    diffConstant = sendBarHeightConstraint.constant - sendTextViewHeightConstraint.constant
    sendTextView.autoresizeTextViewDelegate = self
    sendButton.addTarget(self, action: "sendMessage:", forControlEvents: UIControlEvents.TouchUpInside)
  }
  
  //MARK: Keyboard Delegate
  func keyboardWillHide(notification: NSNotification) {
    guard let _ = notification.userInfo else {
      return
    }
    
    UIView.animateWithDuration(0.1, animations: { () -> Void in
      self.bottomSpacingConstraint.constant = 0
      self.view.layoutIfNeeded()
    })
  }
  
  func keyboardWillShow(notification: NSNotification) {
    
    guard let userInfo = notification.userInfo else {
      return
    }
    
    let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
    UIView.animateWithDuration(0.1, animations: {
      () -> Void in
      
      
      self.bottomSpacingConstraint.constant = keyboardSize.height
      self.view.layoutIfNeeded()
    })
  }
  
  //MARK: Actions
  func sendMessage(sender: AnyObject) {
    
    sendTextView.resignFirstResponder()
    sendTextView.text = ""
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

extension ViewController: ASAutoResizingTextViewDelegate {
  
  func didAutolayoutContraintChanged(constantHeight: CGFloat) {
    sendBarHeightConstraint.constant = constantHeight + 20
  }
}

