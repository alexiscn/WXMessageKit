//
//  SampleData.swift
//  WXMessageKitExample
//
//  Created by xushuifeng on 2020/3/8.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import Foundation

struct SampleData {
    
    func messages() -> [Message] {
        return [
            text(),
            text()
        ]
    }
    
    private func text() -> Message {
        return Message(formatTime: nil, content: .text("Hello world"), messageId: "11", isOutgoing: true)
    }
    
}
