//
//  WXMessage.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

public protocol WXMessage {
    
    var messageId: String { get set }
    
    var isOutgoing: Bool { get set }
    
}
