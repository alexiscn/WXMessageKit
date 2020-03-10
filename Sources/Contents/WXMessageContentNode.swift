//
//  WXMessageContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import UIKit
import AsyncDisplayKit

open class WXMessageContentNode: ASDisplayNode {
    
    public let message: WXMessage
    
    public init(message: WXMessage) {
        self.message = message
    }
}
