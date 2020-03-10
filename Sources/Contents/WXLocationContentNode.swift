//
//  WXLocationContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import AsyncDisplayKit

public class WXLocationContentNode: WXMessageContentNode {
    
    public struct Constants {
        
        public static var senderInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        
        public static var recevierInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
    }
    
    public let bubbleNode = ASImageNode()
    
    public let loadingNode = ASImageNode()
    
    public let titleNode = ASTextNode()
    
    public let descNode = ASTextNode()
    
    public let hairlineNode = ASDisplayNode()
    
    public let thumbNode = ASImageNode()
    
    public let location: WXLocation
    
    public init(message: WXMessage, location: WXLocation) {
        self.location = location
        super.init(message: message)
        
        automaticallyManagesSubnodes = true
        
        let icon = message.isOutgoing ? "ChatRoom_Bubble_App_Sender_57x40_": "ChatRoom_Bubble_Text_Receiver_White_57x40_"
        bubbleNode.image = UIImage(named: icon)
        bubbleNode.style.flexShrink = 1
        
        titleNode.maximumNumberOfLines = 1
        descNode.maximumNumberOfLines = 1
        
        //titleNode.attributedText = location.attributedStringForTitle()
        //descNode.attributedText = location.attributedStringForDesc()
        thumbNode.image = location.thumbImage
        //hairlineNode.backgroundColor = Colors.DEFAULT_BORDER_COLOR
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let width = WXUtility.screenWidth * 0.625
                
        titleNode.style.layoutPosition = CGPoint(x: 12, y: 10)
        titleNode.style.preferredSize = CGSize(width: width - 24, height: 20)
        
        descNode.style.layoutPosition = CGPoint(x: 12, y: 32)
        descNode.style.preferredSize = CGSize(width: width - 24, height: 15)
        
        hairlineNode.style.layoutPosition = CGPoint(x: 0, y: 52)
        hairlineNode.style.preferredSize = CGSize(width: width, height: WXUtility.lineHeight)
        
        let topLayout = ASAbsoluteLayoutSpec(children: [titleNode, descNode, hairlineNode])
        
        let layout = ASStackLayoutSpec.vertical()
        layout.style.preferredSize = CGSize(width: width, height: 148)
        thumbNode.style.preferredSize = CGSize(width: width, height: 95)
        layout.children = [topLayout, thumbNode]
        
        let insets = message.isOutgoing ? Constants.senderInsets : Constants.recevierInsets
        return ASBackgroundLayoutSpec(child: ASInsetLayoutSpec(insets: insets, child: layout), background: bubbleNode)
    }
}
