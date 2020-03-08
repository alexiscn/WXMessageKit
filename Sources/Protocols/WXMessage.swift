//
//  WXMessage.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

public protocol WXMessage {
    
    var messageId: String { get set }
    
    var content: WXMessageContent { get set }
    
    var isOutgoing: Bool { get set }
    
    var formatTime: String? { get }
}

public enum WXMessageContent {
    case text(String)
    case voice
    case custom(Any?)
}

public protocol WXMediaContent {
    
    var size: CGSize { get }
    
}
