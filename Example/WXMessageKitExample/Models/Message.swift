//
//  Message.swift
//  WXMessageKitExample
//
//  Created by xushuifeng on 2020/3/5.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import Foundation
import WXMessageKit

struct Message: WXMessage {
    
    var formatTime: String?
    
    var content: WXMessageContent

    var messageId: String
    
    var isOutgoing: Bool
    
}
