//
//  WXExpressionParser.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/9.
//

import Foundation

public protocol WXExpressionParser {
    
    func attributedText(with attributedText: NSAttributedString) -> NSAttributedString
    
    func parse(text: String) -> [WXExpressionResult]
}

extension WXExpressionParser {
    
    func parse(text: String) -> [WXExpressionResult] {
        guard text.count > 2 else {
            return []
        }
        let pattern = "\\[/?[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]"
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return []
        }
        let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))
        if matches.count == 0 {
            return []
        }
        return []
    }
    
}

public protocol WXExpressionResult {
    
    var range: NSRange { get }
    
    var text: String { get }
    
    var expression: String? { get }
}

public protocol WXExpression {
    
}
