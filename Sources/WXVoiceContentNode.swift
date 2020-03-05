//
//  WXVoiceContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import AsyncDisplayKit

public class WXVoiceContentNode: ASDisplayNode {
    
    public struct Constants {
    
    }
    
    public let bubbleNode = ASImageNode()
    
    public let imageNode = ASImageNode()
    
    public let durationNode = ASTextNode()
    
    public let unreadNode = ASImageNode()
    
    public override func didLoad() {
        super.didLoad()
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASLayoutSpec()
    }
}
