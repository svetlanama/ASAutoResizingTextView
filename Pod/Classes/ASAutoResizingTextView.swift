//
//  ASAutoResizingTextView.swift
//  ASAutoResizingTextView
//
//  Created by and Alexander Vasileyko and Svitlana Moiseyenko on 2/4/16.
//  Copyright © 2016 and Alexander Vasileyko and Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit


@objc public protocol ASAutoResizingTextViewDelegate: class {
  
  /**
   Delegate method for notifying parent views about size changes
   */
  func didAutolayoutContraintChanged(constantHeight: CGFloat)
}

@objc public class ASAutoResizingTextView: UITextView{
  
  public weak var autoresizeTextViewDelegate: ASAutoResizingTextViewDelegate?
  var heightConstraint: NSLayoutConstraint?
  
  var minHeight: CGFloat?
  var maxHeight: CGFloat = 100.0
  @IBInspectable var maxTextViewHeight: CGFloat {
    set(newValue) {
      maxHeight = newValue
    }
    get {
      return maxHeight
    }
  }
  
  override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    minHeight = bounds.size.height
    initConstraints()
  }
  
  /**
   Initialization height contraint by getting it from editor and apply to local variable
   */
  func initConstraints() {
    
    for constraint in constraints {
      if  constraint.firstAttribute == NSLayoutAttribute.Height  {
        heightConstraint = constraint
        break
      }
    }
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    // Check if there was not height contraint notify user about this
    assert(heightConstraint != nil, "Unable to find height auto-layout constraint.Please add height contraint into textView")
    
    handleLayoutWithAutoLayouts()
  }
  
  /**
   Check if episode contains in array
   */
  func handleLayoutWithAutoLayouts() {
    
    var internalSize: CGSize = self.intrinsicContentSize()
    if (minHeight != nil) {
      internalSize.height = max(internalSize.height, minHeight!)
    }
    //if (maxHeight != nil) {
    internalSize.height = min(internalSize.height, maxHeight)
    //}
    heightConstraint!.constant = internalSize.height
    autoresizeTextViewDelegate?.didAutolayoutContraintChanged(heightConstraint!.constant)
  }
  
  /**
   Get internal content size based on insets
   
   :returns: CGSize
   */
  override public func intrinsicContentSize() -> CGSize {
    
    var intrinsicContentSize = self.contentSize
    if (UIDevice.currentDevice().systemVersion as NSString).floatValue >= 7.0 {
      intrinsicContentSize.width += (self.textContainerInset.left + self.textContainerInset.right ) / 2.0
      intrinsicContentSize.height += (self.textContainerInset.top + self.textContainerInset.bottom) / 2.0
    }
    return intrinsicContentSize
  }
}