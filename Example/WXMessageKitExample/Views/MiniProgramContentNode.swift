//
//  MiniProgramContentNode.swift
//  WXMessageKitExample
//
//  Created by xushuifeng on 2020/3/9.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import AsyncDisplayKit
import WXMessageKit

class MiniProgramContentNode: WXMessageContentNode {
    
    init(message: WXMessage, program: MiniProgram) {
        super.init(message: message)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASLayoutSpec()
    }
    
}

struct MiniProgram {
    
}
