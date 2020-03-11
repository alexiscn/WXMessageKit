//
//  WXNoticeContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import AsyncDisplayKit

public class WXNoticeContentNode: WXMessageContentNode {
    
    public init(message: WXMessage, notice: WXNotice) {
        super.init(message: message)
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASLayoutSpec()
    }
}
