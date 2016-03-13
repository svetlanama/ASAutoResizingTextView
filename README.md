# ASAutoResizingTextView

[![CI Status](http://img.shields.io/travis/Svitlana Moiseyenko/ASAutoResizingTextView.svg?style=flat)](https://travis-ci.org/Svitlana Moiseyenko/ASAutoResizingTextView)
[![Version](https://img.shields.io/cocoapods/v/ASAutoResizingTextView.svg?style=flat)](http://cocoapods.org/pods/ASAutoResizingTextView)
[![License](https://img.shields.io/cocoapods/l/ASAutoResizingTextView.svg?style=flat)](http://cocoapods.org/pods/ASAutoResizingTextView)
[![Platform](https://img.shields.io/cocoapods/p/ASAutoResizingTextView.svg?style=flat)](http://cocoapods.org/pods/ASAutoResizingTextView)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ASAutoResizingTextView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:



```ruby
pod "ASAutoResizingTextView"
```


After installation put the `TextView` control into your `ViewController` and in the Inspector choose the `ASAutoResizingTextView` class for it. 

![Alt text](https://github.com/svetlanama/ASAutoResizingTextView/blob/master/Example/images/configuration1.png "Demo")

Do not forget to create the param `sendTextViewHeightConstraint`(call it whatever you want) and to connect this with the constraint in the Inspector `textViewHeight`.

![Alt text](https://github.com/svetlanama/ASAutoResizingTextView/blob/master/Example/images/configuration2.png "Demo")


## Demo

![Alt text](https://github.com/svetlanama/ASAutoResizingTextView/blob/master/Example/images/animation.gif "Demo")


You can change the max-height manually directly from the Inspector settings.

![Alt text](https://github.com/svetlanama/ASAutoResizingTextView/blob/master/Example/images/demo_max_height.png "Max Height Demo")


## Author

vasileyko.alex@gmail.com, Alexander Vasileyko (https://github.com/alexnodejs)

alexandrovna.sveta@gmail.com, Svitlana Moiseyenko (https://github.com/svetlanama)

## Referring links
https://github.com/adam-siton/AUIAutoGrowingTextView

http://www.hanspinckaers.com/multi-line-uitextview-similar-to-sms

## License

ASAutoResizingTextView is available under the MIT license. See the LICENSE file for more info.
