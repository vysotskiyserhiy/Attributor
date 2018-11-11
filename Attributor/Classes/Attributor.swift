//
//  Attributor.swift
//  Attributor
//
//  Created by Serhiy Vysotskiy on 10/5/18.
//  Copyright © 2018 Serhiy Vysotskiy. All rights reserved.
//

import UIKit

public class Attributor {
    private let string: String
    private var attributes: [NSRange : [NSAttributedString.Key : Any]] = [:]
    
    public init(string: String) {
        self.string = string
    }
    
    public var attributed: NSAttributedString {
        let attributed = NSMutableAttributedString(string: string)
        
        for (range, attributes) in attributes {
            attributed.addAttributes(attributes, range: range)
        }
        
        return attributed
    }
}


// MARK: - Apply
extension Attributor {
    public func apply(to object: UILabel) {
        object.attributedText = attributed
    }
    
    public func apply(to object: UIButton, for state: UIControl.State = .normal) {
        object.setAttributedTitle(attributed, for: state)
    }
    
    public func apply(to object: UITextView) {
        object.attributedText = attributed
    }
    
    public func apply(to object: UITextField) {
        object.attributedText = attributed
    }
}


// MARK: - Add/Set attributes
public extension Attributor {
    public func adding(attribute value: Any, for key: NSAttributedString.Key, range: NSRange? = nil) -> Attributor {
        let unwrappedRange = range ?? NSRange(location: 0, length: string.count)
        attributes[unwrappedRange, default: [:]][key] = value
        return self
    }
    
    public func setting(attribute value: Any, for key: NSAttributedString.Key, range: NSRange? = nil) -> Attributor {
        let unwrappedRange = range ?? NSRange(location: 0, length: string.count)
        attributes[unwrappedRange] = [key : value]
        return self
    }
    
    public func adding(attributes values: [NSAttributedString.Key : Any], range: NSRange? = nil) -> Attributor {
        let unwrappedRange = range ?? NSRange(location: 0, length: string.count)
        
        for (key, attribute) in values {
            attributes[unwrappedRange, default: [:]][key] = attribute
        }
        
        return self
    }
    
    public func setting(attributes values: [NSAttributedString.Key : Any], range: NSRange? = nil) -> Attributor {
        let unwrappedRange = range ?? NSRange(location: 0, length: string.count)
        attributes[unwrappedRange] = values
        return self
    }
}



extension Attributor {
    public func adding(font: UIFont, range: NSRange? = nil) -> Attributor {
        return adding(attribute: font, for: .font, range: range)
    }
    
    public func adding(color: UIColor, range: NSRange? = nil) -> Attributor {
        return adding(attribute: color, for: .foregroundColor, range: range)
    }
    
    public func adding(kern: CGFloat, range: NSRange? = nil) -> Attributor {
        return adding(attribute: kern, for: .kern, range: range)
    }
    
    public func adding(lineSpace: CGFloat, range: NSRange? = nil) -> Attributor {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpace
        return adding(attribute: style, for: .paragraphStyle, range: range)
    }
}



extension String {
    public var attributor: Attributor {
        return Attributor(string: self)
    }
}
