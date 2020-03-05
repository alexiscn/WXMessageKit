//
//  WXContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import UIKit
import AsyncDisplayKit

public class WXContentNode: ASDisplayNode {
    
    public let message: WXMessage
    
    public init(_ message: WXMessage) {
        self.message = message
    }
}
