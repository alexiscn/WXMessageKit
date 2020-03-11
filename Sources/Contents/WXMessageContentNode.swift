//
//  WXMessageContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import UIKit
import AsyncDisplayKit

/// The base node for message content.
/// Note: custom content node should inherit `WXMessageContentNode`
open class WXMessageContentNode: ASDisplayNode {
    
    public let message: WXMessage
    
    public init(message: WXMessage) {
        self.message = message
    }
}
