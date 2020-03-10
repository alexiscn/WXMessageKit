//
//  WXTimeNode.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import AsyncDisplayKit

public class WXTimeNode: ASDisplayNode {
    
    public struct Constants {
        
        public static var insets = UIEdgeInsets(top: 1.5, left: 5, bottom: 1.5, right: 5)
        
        public static var backgroundImage = WXUtility.image(named: "MessageContent_TimeNodeBkg_Light_30x18_")
        
        public static var textColor = UIColor(white: 0, alpha: 0.3)
        
        public static var textColorWithBackgroundImage = UIColor(white: 0, alpha: 0.9)
        
        public static var font = UIFont.systemFont(ofSize: 14)
    }
    
    private let textNode = ASTextNode2()
    
    private let backgroundNode = ASImageNode()
    
    public init(timeText: String, displayBackground: Bool) {
        super.init()
        
        automaticallyManagesSubnodes = true
        
        backgroundNode.image = Constants.backgroundImage
        backgroundNode.isHidden = !displayBackground
        
        let textColor = displayBackground ? Constants.textColorWithBackgroundImage: Constants.textColor
        
        let attributes = [
            NSAttributedString.Key.font: Constants.font,
            NSAttributedString.Key.foregroundColor: textColor
        ]
        textNode.attributedText = NSAttributedString(string: timeText, attributes: attributes)
    }
 
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let textSpec = ASInsetLayoutSpec(insets: Constants.insets, child: textNode)
        let backgroundSpec = ASBackgroundLayoutSpec(child: textSpec, background: backgroundNode)
        return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: backgroundSpec)
    }
}
