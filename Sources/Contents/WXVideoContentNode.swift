//
//  WXVideoContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/8.
//

import AsyncDisplayKit

public class WXVideoContentNode: WXContentNode {
    
    public override func didLoad() {
        super.didLoad()
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASLayoutSpec()
    }
}
