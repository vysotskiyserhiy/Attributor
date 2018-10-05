//
//  Attributor.swift
//  Attributor
//
//  Created by Serhiy Vysotskiy on 10/5/18.
//  Copyright © 2018 Serhiy Vysotskiy. All rights reserved.
//

import UIKit

class Attributor {
    private let string: String
    private var attributes: [NSRange : [NSAttributedString.Key : Any]] = [:]
    
    init(string: String) {
        self.string = string
    }
    
    func apply(to label: UILabel) {
        
    }
    
    func adding(attribute value: Any, for key: NSAttributedString.Key, range: NSRange? = nil) -> Attributor {
        let unwrappedRange = range ?? NSRange(location: 0, length: string.count)
        attributes[unwrappedRange, default: [:]][key] = value
        return self
    }
    
    func setting(attribute value: Any, for key: NSAttributedString.Key, range: NSRange? = nil) -> Attributor {
        let unwrappedRange = range ?? NSRange(location: 0, length: string.count)
        attributes[unwrappedRange] = [key : value]
        return self
    }
    
    func adding(attributes values: [NSAttributedString.Key : Any], range: NSRange? = nil) -> Attributor {
        let unwrappedRange = range ?? NSRange(location: 0, length: string.count)
        
        for (key, attribute) in values {
            attributes[unwrappedRange, default: [:]][key] = attribute
        }
        
        return self
    }
    
    func setting(attributes values: [NSAttributedString.Key : Any], range: NSRange? = nil) -> Attributor {
        let unwrappedRange = range ?? NSRange(location: 0, length: string.count)
        attributes[unwrappedRange] = values
        return self
    }
    
    var attributed: NSAttributedString {
        let attributed = NSMutableAttributedString(string: string)
        
        for (range, attributes) in attributes {
            attributed.addAttributes(attributes, range: range)
        }
        
        return attributed
    }
}
