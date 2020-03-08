//
//  WXImageContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import AsyncDisplayKit

public class WXImageContentNode: WXContentNode {
    
    public struct Constants {
        
        public static var preferredSize = CGSize(width: 200, height: 200)
        
        public static var preferredCornerRadius: CGFloat = 6.0
        
        public static var senderInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        
        public static var recevierInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
    }
    
    private let imageNode: ASNetworkImageNode = ASNetworkImageNode()
    
    public let media: WXMediaContent
    
    public init(message: WXMessage, media: WXMediaContent) {
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
        let insets = message.isOutgoing ? Constants.senderInsets: Constants.recevierInsets
        return ASInsetLayoutSpec(insets: insets, child: ratioLayoutSpec)
    }
}
