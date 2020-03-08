//
//  WXMessageCellNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/7.
//

import AsyncDisplayKit

open class WXMessageCellNode: ASCellNode {
    
    public struct Constants {
        
        /// The size for avatar. 40x40 by default.
        public static var avatarPreferredSize = CGSize(width: 40, height: 40)
        
        /// The insets for the layout.
        public static var insets = UIEdgeInsets(top: 5, left: 12, bottom: 5, right: 12)
        
        public static var displayTimeBackground = false
        
        public static var preferredTimeLabelHeight: CGFloat = 44.0
    }
    
    public weak var delegate: WXMessageCellNodeDelegate?
    
    public var timeNode: WXTimeNode?
    
    public var contentTopTextNode: ASTextNode?
    
    public let contentNode: WXContentNode
    
    public var bottomTextNode: ASTextNode?
    
    public var avatarNode: ASNetworkImageNode = ASNetworkImageNode()
    
    public var statusNode: ASImageNode?
    
    public let message: WXMessage
    
    public init(message: WXMessage, contentNode: WXContentNode) {
        self.message = message
        self.contentNode = contentNode
        
        if let formattedTime = message.formatTime {
            timeNode = WXTimeNode(timeText: formattedTime, displayBackground: Constants.displayTimeBackground)
        }
        
        super.init()
        
        if let timeNode = timeNode {
            addSubnode(timeNode)
        }
        
        addSubnode(avatarNode)
        addSubnode(contentNode)
        
        if let bottomTextNode = bottomTextNode {
            addSubnode(bottomTextNode)
        }
        
        avatarNode.image = WXUtility.image(named: "DefaultHead_48x48_")
    }
    
    open override func didLoad() {
        super.didLoad()
        
        isUserInteractionEnabled = true
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        self.view.addGestureRecognizer(tapGR)
        
        let longPressGR = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressedGesture(_:)))
        self.view.addGestureRecognizer(longPressGR)
    }
    
    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        
    }
    
    @objc private func handleLongPressedGesture(_ gestureRecognizer: UILongPressGestureRecognizer) {
        
    }
    
    open override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let contentVerticalStack = ASStackLayoutSpec.vertical()
        contentVerticalStack.style.flexShrink = 1.0
        contentVerticalStack.style.flexGrow = 1.0
        contentVerticalStack.style.spacingAfter = 5.0
        contentVerticalStack.style.spacingBefore = 5.0
        if let contentTopTextNode = contentTopTextNode {
            contentVerticalStack.children = [contentTopTextNode, contentNode]
        } else {
            contentVerticalStack.children = [contentNode]
        }
        
        let contentHorizontalStack = ASStackLayoutSpec.horizontal()
        contentHorizontalStack.justifyContent = .start
        let fakeAvatarNode = ASDisplayNode()
        fakeAvatarNode.style.preferredSize = Constants.avatarPreferredSize
        if message.isOutgoing {
            contentHorizontalStack.children = [fakeAvatarNode, contentVerticalStack, avatarNode]
        } else {
            contentHorizontalStack.children = [avatarNode, contentVerticalStack, fakeAvatarNode]
        }
        let contentHorizontalSpec = ASInsetLayoutSpec(insets: .zero, child: contentHorizontalStack)
        
        let layoutSpec = ASStackLayoutSpec.vertical()
        layoutSpec.justifyContent = .start
        layoutSpec.alignItems = message.isOutgoing ? .end: .start
        var layoutElements: [ASLayoutElement] = []
        if let topTextNode = timeNode {
            topTextNode.style.preferredSize = CGSize(width: WXUtility.screenWidth, height: Constants.preferredTimeLabelHeight)
            layoutElements.append(topTextNode)
        }
        layoutElements.append(contentHorizontalSpec)
        if let bottomTextNode = bottomTextNode {
            layoutElements.append(bottomTextNode)
        }
        layoutSpec.children = layoutElements
        
        return ASInsetLayoutSpec(insets: Constants.insets, child: layoutSpec)
    }
}

@objc public protocol WXMessageCellNodeDelegate: class {
    
    @objc optional func messageCellDidTapAvatar(_ cell: WXMessageCellNode)
}
