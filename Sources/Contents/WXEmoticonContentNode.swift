//
//  WXEmoticonContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import AsyncDisplayKit
import PINRemoteImage
import FLAnimatedImage

public class WXEmoticonContentNode: WXMessageContentNode {
    
    public struct Constants {
        
        /// The preferred size for emoticon. 120x120 by default.
        public static var preferredSize = CGSize(width: 120, height: 120)
        
        /// The preferred insets for emticon. (6, 6, 6, 6) by default.
        public static var preferredInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    }
    
    public let emoticon: WXEmoticon
    
    public let imageNode = ASDisplayNode()
    
    public lazy var animatedImageView: FLAnimatedImageView = {
        let animatedImage = FLAnimatedImageView()
        return animatedImage
    }()
    
    public init(message: WXMessage, emoticon: WXEmoticon) {
        self.emoticon = emoticon
        super.init(message: message)
        addSubnode(imageNode)
        setViewBlock { [weak self] () -> UIView in
            return self?.animatedImageView ?? UIView()
        }
    }
    
    public override func didLoad() {
        super.didLoad()
        
        animatedImageView.pin_setImage(from: emoticon.url)
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        imageNode.style.preferredSize = Constants.preferredSize
        return ASInsetLayoutSpec(insets: Constants.preferredInsets, child: imageNode)
    }
}
