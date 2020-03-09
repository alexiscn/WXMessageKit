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

public protocol WXExpressionResult {
    
    var range: NSRange { get }
    
    var text: String { get }
    
    var expression: String? { get }
}
