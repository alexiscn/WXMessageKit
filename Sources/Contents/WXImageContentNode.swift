//
//  WXImageContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import AsyncDisplayKit

public class WXImageContentNode: WXMessageContentNode {
    
    public struct Constants {
        
        /// The preferred size for image content displaying. 200x200 by default.
        public static var preferredSize = CGSize(width: 200, height: 200)
        
        /// The cornerRadius of the image cell. 6 by default.
        public static var preferredCornerRadius: CGFloat = 6.0
        
        /// The insets for sender. UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5) by default.
        public static var senderInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        
        /// The insets for receiver.
        public static var receiverInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
    }
    
    public let imageNode: ASNetworkImageNode = ASNetworkImageNode()
    
    public let media: WXMediaItem
    
    public init(message: WXMessage, media: WXMediaItem) {
        self.media = media
        super.init(message: message)
        automaticallyManagesSubnodes = true
        
        imageNode.cornerRadius = Constants.preferredCornerRadius
        imageNode.cornerRoundingType = .precomposited
        
        if let image = media.image {
            imageNode.image = image
        } else {
            imageNode.url = media.url
        }
    }
 
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let size = media.size == .zero ? Constants.preferredSize: media.size
        let ratio = size.height / size.width
        let maxSize = WXUtility.screenWidth * 0.4
        let ratioLayoutSpec = ASRatioLayoutSpec(ratio: ratio, child: imageNode)
        ratioLayoutSpec.style.maxSize = CGSize(width: maxSize, height: maxSize)
        let insets = message.isOutgoing ? Constants.senderInsets: Constants.receiverInsets
        return ASInsetLayoutSpec(insets: insets, child: ratioLayoutSpec)
    }
}
