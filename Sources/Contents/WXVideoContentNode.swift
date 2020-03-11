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
    
    /// The background shadow node for info content.
    public let shadowNode = ASImageNode()
    
    public let lengthNode = ASTextNode2()
    
    public let video: WXVideoItem
    
    public init(message: WXMessage, video: WXVideoItem) {
        self.video = video
        super.init(message: message)
        
        automaticallyManagesSubnodes = true
        
        thumbImageNode.url = video.url
        thumbImageNode.cornerRadius = 6.0
        thumbImageNode.cornerRoundingType = .precomposited
        
        iconImageNode.image = WXUtility.imageNamed("WX_Video_Play_40x40_")
        shadowNode.image = WXUtility.imageNamed("WX_Video_shadow_4x28_")
        shadowNode.cornerRadius = 6.0
        shadowNode.cornerRoundingType = .precomposited
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .right
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        let length = WXUtility.formatDuration(video.duration)
        lengthNode.attributedText = NSAttributedString(string: length, attributes: attributes)
    }
    
    public override func didLoad() {
        super.didLoad()
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let size = video.size == .zero ? Constants.preferredSize: video.size
        let ratio = size.height / size.width
        
        let maxWidth = WXUtility.screenWidth * 0.4
        var width: CGFloat
        var height: CGFloat
        if ratio > 1.0 {
            width = maxWidth / ratio
            height = maxWidth
        } else {
            width = maxWidth
            height = maxWidth * ratio
        }
        width = max(width, 60.0)
        height = max(height, 60.0)
        
        thumbImageNode.style.preferredSize = CGSize(width: width, height: height)
        thumbImageNode.style.layoutPosition = .zero
        
        iconImageNode.style.preferredSize = CGSize(width: 40.0, height: 40.0)
        iconImageNode.style.layoutPosition = CGPoint(x: (width - 40.0)/2.0, y: (height - 40.0)/2.0)
        
        shadowNode.style.preferredSize = CGSize(width: width, height: 20.0)
        shadowNode.style.layoutPosition = CGPoint(x: 0, y: height - 20.0)
        
        lengthNode.style.preferredSize = CGSize(width: width - 6.0, height: 13)
        lengthNode.style.layoutPosition = CGPoint(x: 0, y: height - 17.5)
        
        let layout = ASAbsoluteLayoutSpec(children: [thumbImageNode, iconImageNode, shadowNode, lengthNode])
        
        let insets = UIEdgeInsets(top: 0, left: message.isOutgoing ? 0: 5, bottom: 0, right: message.isOutgoing ? 5: 0)
        return ASInsetLayoutSpec(insets: insets, child: layout)
    }
}
