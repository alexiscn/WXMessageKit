//
//  WXVideoContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/8.
//

import AsyncDisplayKit

public class WXVideoContentNode: WXMessageContentNode {
    
    public struct Constants {
        public static var preferredSize = CGSize(width: 200, height: 200)
    }
    
    public let thumbImageNode = ASNetworkImageNode()
    
    public let iconImageNode = ASImageNode()
    
    public let videoInfoBackgroundNode = ASImageNode()
    
    public let videoLengthNode = ASTextNode2()
    
    public init(message: WXMessage, video: WXMedia) {
        super.init(message: message)
    }
    
    public override func didLoad() {
        super.didLoad()
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASLayoutSpec()
    }
}
