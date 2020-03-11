//
//  WXVoiceContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import AsyncDisplayKit

public class WXVoiceContentNode: WXMessageContentNode {
    
    public struct Constants {
        
        public static var senderBubble = WXUtility.imageNamed("WX_Bubble_Text_Sender_Green_57x40_")
    
        public static var receiverBubble = WXUtility.imageNamed("WX_Bubble_Text_Receiver_White_57x40_")
        
        public static var unreadImage = WXUtility.imageNamed("WX_VoiceNodeUnread_8x8_")
        
        public static var preferredSize = CGSize(width: 8, height: 8)
    }
    
    public let bubbleNode = ASImageNode()
    
    public let imageNode = ASImageNode()
    
    public let durationNode = ASTextNode()
    
    public let unreadNode = ASImageNode()
    
    public let voice: WXVoice
    
    public init(message: WXMessage, voice: WXVoice) {
        self.voice = voice
        super.init(message: message)
        
        automaticallyManagesSubnodes = true
        
        let bubble = message.isOutgoing ? Constants.senderBubble : Constants.receiverBubble
        bubbleNode.image = bubble
        bubbleNode.style.flexShrink = 1
        
        unreadNode.image = Constants.unreadImage
        unreadNode.style.preferredSize = Constants.preferredSize
    }
    
    public override func didLoad() {
        super.didLoad()
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let stack = ASStackLayoutSpec.horizontal()
        stack.alignItems = .center
        imageNode.style.preferredSize = CGSize(width: 24, height: 24)
        
        let spacer = ASLayoutSpec()
        spacer.style.flexGrow = 1.0
        spacer.style.flexShrink = 1.0
        spacer.style.height = ASDimension(unit: .points, value: 40)
        spacer.style.minWidth = ASDimensionMake(20)
        
        if message.isOutgoing {
            imageNode.style.spacingAfter = 12
            imageNode.style.spacingBefore = 3
            stack.children = [spacer, durationNode, imageNode]
        } else {
            imageNode.style.spacingAfter = 3
            imageNode.style.spacingBefore = 12
            stack.children = [imageNode, durationNode, spacer]
        }
        
        let backgroundSpec = ASBackgroundLayoutSpec(child: stack, background: bubbleNode)
        
        let layout = ASStackLayoutSpec.horizontal()
        layout.alignItems = .center
        layout.spacing = 10
        layout.children = message.isOutgoing ? [backgroundSpec] : [backgroundSpec, unreadNode]
        return ASInsetLayoutSpec(insets: .zero, child: layout)
    }
}
