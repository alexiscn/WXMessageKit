//
//  ChatRoomDataSource.swift
//  WXMessageKitExample
//
//  Created by xushuifeng on 2020/3/5.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import WXMessageKit

struct ChatRoomDataSource: WXMessageDataSource {
    
    var message: [Message]
    
    func numberOfMessages() -> Int {
        return message.count
    }
    
    func message(at index: Int) -> WXMessage {
        return message[index]
    }
}
