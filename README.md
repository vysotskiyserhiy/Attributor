# Attributor

[![Version](https://img.shields.io/cocoapods/v/Attributor.svg?style=flat)](http://cocoapods.org/pods/Attributor)
[![License](https://img.shields.io/cocoapods/l/Attributor.svg?style=flat)](http://cocoapods.org/pods/Attributor)
[![Platform](https://img.shields.io/cocoapods/p/Attributor.svg?style=flat)](http://cocoapods.org/pods/Attributor)


## Easy NSAttributedString creation

Add padding to responsive elements 
```swift
// Add common attributes

let label = UILabel()
        
"Hello world!".attributor
    .adding(font: UIFont.systemFont(ofSize: 35, weight: .bold))
    .adding(color: .red)
    .adding(kern: 10)
    .adding(lineSpace: 20)
.apply(to: label)

// Or any attributes you want

let button = UIButton()

"Hello world!".attributor
    .adding(attributes: [
        .foregroundColor : UIColor.black,
        .backgroundColor : UIColor.purple
    ])

    .adding(attribute: UIColor.white, for: .foregroundColor, range: NSRange(location: 0, length: 5))
.apply(to: button, for: .normal)
```

## Installation

Handlers is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Attributor'
```

## Author

Serge Vysotsky

## License

Attributor is available under the MIT license. See the LICENSE file for more info.
