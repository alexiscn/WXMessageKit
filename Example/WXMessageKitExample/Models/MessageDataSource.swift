//
//  MessageDataSource.swift
//  WXMessageKitExample
//
//  Created by xushuifeng on 2020/3/5.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import WXMessageKit
import AsyncDisplayKit

struct MessageDataSource: WXMessageDataSource {
    
    var message: [Message]
    
    func numberOfMessages() -> Int {
        return message.count
    }
    
    func message(at index: Int) -> WXMessage {
        return message[index]
    }
    
    func customContentNode(for content: WXMessageContent, at indexPath: IndexPath) -> WXMessageContentNode? {
        let msg = message(at: indexPath.row)
        switch content {
        case .custom(let value):
            if let program = value as? MiniProgram {
                return MiniProgramContentNode(message: msg, program: program)
            }
        default:
            break
        }
        fatalError("Custom content node not implemented!!! ")
    }
}
