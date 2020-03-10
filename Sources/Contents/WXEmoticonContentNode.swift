//
//  WXEmoticonContentNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import AsyncDisplayKit
import PINRemoteImage

public class WXEmoticonContentNode: WXMessageContentNode {
    
    public struct Constants {
        
        /// The preferred size for emotion. 120x120 by default.
        public static var preferredSize = CGSize(width: 120, height: 120)
        
        public static var preferredInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    }
    
    public let emoticon: WXEmoticon
    
    public let imageNode = ASDisplayNode()
    
    public lazy var animatedImageView: UIImageView = {
        let animatedImage = UIImageView()
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
        imageNode.style.preferredSize = Constants.preferredSize
        animatedImageView.pin_setImage(from: emoticon.url)
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: Constants.preferredInsets, child: imageNode)
    }
}
