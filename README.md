# HS-Font-Icons

Easily use resolution-independant font-icons

Currently Supports
- Google Material Icons (3.0.1)
- Font Awesome (5.3)



<p align="center">
  <img height="480" src="https://raw.githubusercontent.com/ConfusedVorlon/HS-Google-Material-Design-Icons/master/resources/image1.png"/>
</p>

## Requirements

- iOS 8.0+
- Xcode 10
- Swift 4.2

## Installation

### CocoaPods


```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod 'HS-Font-Icons'
```

Do not forget to import to your swift files where you want to use this library:
```swift
import HS_Font_Icons
```


## Usage


### UILabel
```Swift
    labelName.icon = .public

    labelName.textColor = UIColor.redColor()
```

### UIButton
```Swift
    buttonName.setIcon(.public)

    //or if you want to set an icon size and/or specify the state, use:
    buttonName.setIcon(.public, forState: .highlighted, iconSize: 30)

    buttonName.setTitleColor(UIColor.redColor(), forState: .normal)
```

### UIBarButtonItem
```Swift
    //Standard font size
    barName.icon = .public

    //Custom font size
    barName.setIcon(.public, iconSize: 35)

    barName.tintColor = UIColor.redColor()
```


## Original Based on Google-Material-Design-Icons

Patrik Vaberer, patrik.vaberer@gmail.com

- [LinkedIn](https://sk.linkedin.com/in/vaberer)
- [@vaberer](https://twitter.com/vaberer)
- [Blog](http://vaberer.me)

### Licence

HS-Font-Icons Icons is available under the MIT license. See the LICENSE file for more info.


