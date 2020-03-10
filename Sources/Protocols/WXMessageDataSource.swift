//
//  WXMessageDataSource.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import AsyncDisplayKit

public protocol WXMessageDataSource {
    
    func numberOfMessages() -> Int
    
    func message(at index: Int) -> WXMessage
    
    func customContentNode(for content: WXMessageContent, at indexPath: IndexPath) -> WXMessageContentNode?
}
