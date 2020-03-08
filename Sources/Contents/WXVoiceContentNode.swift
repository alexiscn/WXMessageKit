//
//  WXVoiceContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import AsyncDisplayKit

public class WXVoiceContentNode: ASDisplayNode {
    
    public struct Constants {
        
        public static var senderBubble = WXUtility.image(named: "ChatRoom_Bubble_Text_Sender_Green_57x40_")
    
        public static var receiverBubble = WXUtility.image(named: "ChatRoom_Bubble_Text_Receiver_White_57x40_")
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
