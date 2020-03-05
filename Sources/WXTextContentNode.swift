//
//  WXTextContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import AsyncDisplayKit

public class WXTextContentNode: WXContentNode {
    
    public struct Constants {
        
        public static var senderEdgeInsets = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 15)
        
        public static var receiverEdgeInsets = UIEdgeInsets(top: 10, left: 17, bottom: 10, right: 12)
     
        public static var senderBubble = UIImage.as_imageNamed("ChatRoom_Bubble_Text_Sender_Green_57x40_")
        
        public static var receiverBubble = UIImage.as_imageNamed("ChatRoom_Bubble_Text_Receiver_White_57x40_")
    }
    
    private let bubbleNode = ASImageNode()
    
    private let textNode = ASTextNode()
    
    public init(message: WXMessage, text: String) {
        super.init(message)
        
        automaticallyManagesSubnodes = true
        bubbleNode.image = message.isOutgoing ? Constants.senderBubble : Constants.receiverBubble
    }
    
    public override func didLoad() {
        super.didLoad()
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        textNode.style.flexGrow = 1.0
        
        let insets = message.isOutgoing ? Constants.senderEdgeInsets : Constants.receiverEdgeInsets
        let insetsLayout = ASInsetLayoutSpec(insets: insets, child: textNode)
        let spec = ASBackgroundLayoutSpec()
        spec.background = bubbleNode
        spec.child = insetsLayout
        return spec
    }
}
