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
    }
    
    private let textNode = ASTextNode()
    
    private let backgroundNode = ASImageNode()
    
    public init(timeText: String, displayBackground: Bool) {
        super.init()
        
        automaticallyManagesSubnodes = true
    }
 
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let textSpec = ASInsetLayoutSpec(insets: Constants.insets, child: textNode)
        let backgroundSpec = ASBackgroundLayoutSpec(child: textSpec, background: backgroundNode)
        return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: backgroundSpec)
    }
}
