//
//  WXTextContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import AsyncDisplayKit

open class WXTextContentNode: WXMessageContentNode {
    
    public struct Constants {
        
        public static var senderEdgeInsets = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 15)
        
        public static var receiverEdgeInsets = UIEdgeInsets(top: 10, left: 17, bottom: 10, right: 12)
        
        /// The font of text cell. `UIFont.systemFont(ofSize: 17)` by default.
        public static var font = UIFont.systemFont(ofSize: 17)
        
        /// The text color. `black` by default.
        public static var textColor = UIColor.black
     
        public static var senderBubble = WXUtility.image(named: "ChatRoom_Bubble_Text_Sender_Green_57x40_")
        
        public static var receiverBubble = WXUtility.image(named: "ChatRoom_Bubble_Text_Receiver_White_57x40_")
    }
    
    public let bubbleNode = ASImageNode()
    
    public let textNode = ASTextNode2()
    
    public init(message: WXMessage, text: String) {
        super.init(message: message)
        
        automaticallyManagesSubnodes = true
        
        bubbleNode.image = message.isOutgoing ? Constants.senderBubble : Constants.receiverBubble
        bubbleNode.style.flexShrink = 1
        
        // Configure text node
        let lineHeight = Constants.font.lineHeight
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.lineSpacing = 3
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.minimumLineHeight = lineHeight
        let attributedText = NSMutableAttributedString(string: text, attributes: [
            .font: Constants.font,
            .foregroundColor: Constants.textColor,
            .paragraphStyle: paragraphStyle
            ])
        // TODO
        textNode.attributedText = attributedText
    }
    
    public override func didLoad() {
        super.didLoad()
        
        textNode.isUserInteractionEnabled = true
        textNode.delegate = self
        textNode.highlightStyle = .light
        textNode.layer.as_allowsHighlightDrawing = true
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

// MARK: - 
extension WXTextContentNode: ASTextNodeDelegate {
    
}
