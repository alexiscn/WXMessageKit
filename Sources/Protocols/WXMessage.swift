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
    case image(WXMediaContent)
    case emoticon(WXEmoticon)
    case voice(WXVoice)
    case custom(Any?)
}

public protocol WXMediaContent {
    
    var size: CGSize { get }
    
    var image: UIImage? { get }
    
    var url: URL? { get }
    
}


public protocol WXEmoticon {
 
    var url: URL? { get }
}

public protocol WXVoice {
    
    var duration: Float { get }
    
}
