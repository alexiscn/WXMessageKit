//
//  WXLinkParser.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/9.
//

import Foundation

public protocol WXLinkParser {
    
    func containsLink(text: String) -> Bool
    
    func match(text: String) -> [WXLinkResult]
}

public protocol WXLinkResult {
    
    var range: NSRange { get }
    
    var url: URL? { get }
    
}

extension WXLinkParser {
    
}
