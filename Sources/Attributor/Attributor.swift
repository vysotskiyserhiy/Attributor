//
//  Attributor.swift
//  Attributor
//
//  Created by Serhiy Vysotskiy on 10/5/18.
//  Copyright © 2018 Serhiy Vysotskiy. All rights reserved.
//

import UIKit

public class Attributor {
    fileprivate enum InitType {
        case string
        case attributedString
    }
    
    fileprivate let initType: InitType
    fileprivate let string: String
    fileprivate let attributedString: NSAttributedString
    
    fileprivate var addAttributes: [(range: NSRange, attributes: [NSAttributedString.Key : Any])] = []
    fileprivate var setAttributes: [(range: NSRange, attributes: [NSAttributedString.Key : Any])] = []
    
    public init(_ string: String) {
        self.string = string
        self.attributedString = NSAttributedString(string: string)
        initType = .string
    }
    
    public init(_ attributed: NSAttributedString) {
        self.string = attributed.string
        self.attributedString = attributed
        initType = .attributedString
    }
    
    public var attributed: NSAttributedString {
        let attributed = NSMutableAttributedString(attributedString: attributedString)
        
        for (range, attributes) in addAttributes {
            attributed.addAttributes(attributes, range: range)
        }
        
        for (range, attributes) in setAttributes {
            attributed.setAttributes(attributes, range: range)
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
    func adding(attribute value: Any, for key: NSAttributedString.Key, range: NSRange? = nil) -> Attributor {
        let unwrappedRange = range ?? NSRange(location: 0, length: string.count)
        addAttributes.append((range: unwrappedRange, attributes: [key : value]))
        return self
    }
    
    func setting(attribute value: Any, for key: NSAttributedString.Key, range: NSRange? = nil) -> Attributor {
        let unwrappedRange = range ?? NSRange(location: 0, length: string.count)
        setAttributes.append((unwrappedRange, [key : value]))
        return self
    }
    
    func adding(attributes values: [NSAttributedString.Key : Any], range: NSRange? = nil) -> Attributor {
        let unwrappedRange = range ?? NSRange(location: 0, length: string.count)
        addAttributes.append((unwrappedRange, values))
        return self
    }
    
    func setting(attributes values: [NSAttributedString.Key : Any], range: NSRange? = nil) -> Attributor {
        let unwrappedRange = range ?? NSRange(location: 0, length: string.count)
        setAttributes.append((unwrappedRange, values))
        return self
    }
}



public extension Attributor {
    func adding(font: UIFont, range: NSRange? = nil) -> Attributor {
        return adding(attribute: font, for: .font, range: range)
    }
    
    func adding(color: UIColor, range: NSRange? = nil) -> Attributor {
        return adding(attribute: color, for: .foregroundColor, range: range)
    }
    
    func adding(kern: CGFloat, range: NSRange? = nil) -> Attributor {
        return adding(attribute: kern, for: .kern, range: range)
    }
    
    func adding(lineSpace: CGFloat, range: NSRange? = nil) -> Attributor {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpace
        return adding(attribute: style, for: .paragraphStyle, range: range)
    }
}



extension String {
    public var attributor: Attributor {
        return Attributor(self)
    }
}

extension NSAttributedString {
    public var attributor: Attributor {
        return Attributor(self)
    }
}

