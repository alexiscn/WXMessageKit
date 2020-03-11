//
//  WXMessage.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//
import CoreLocation

public protocol WXMessage {
    
    var messageId: String { get }
    
    var content: WXMessageContent { get }
    
    var isOutgoing: Bool { get }
    
    var formatTime: String? { get }
}


/// An enum representing the content of a message.
public enum WXMessageContent {
    /// A standard text message.
    case text(String)
    
    /// A image message.
    case image(WXMediaItem)
    
    /// A video message.
    case video(WXMediaItem)
    
    /// A emoticon message.
    case emoticon(WXEmoticon)
    
    /// A voice message.
    case voice(WXVoice)
    
    /// A location message.
    case location(WXLocation)
    
    /// A system notice message.
    case notice(WXNotice)
    
    /// A customize message.
    /// Note: `WXMessageKit` uses the class type of the value to determine which content node is used.
    case custom(Any)
}

public protocol WXMediaItem {
    
    /// The displaying size for `WXMediaItem`. Zero by default, which use `preferredSize` in each content node.
    var size: CGSize { get }
    
    var image: UIImage? { get }
    
    var url: URL? { get }
    
}

public protocol WXEmoticon {
 
    /// The thumbnail for emoticon. Can be `nil`.
    var thumbnail: UIImage? { get }
    
    /// The url of emoticon file. Eihter remote file or local file.
    var url: URL? { get }
}

public protocol WXVoice {
    
    var duration: Float { get }
    
    var url: URL? { get }
    
}

public protocol WXLocation {
    
    var coordinate: CLLocationCoordinate2D { get }
    
    var thumbImage: UIImage? { get }
    
    var thumbURL: URL? { get }
    
    var title: String? { get }
    
    var subTitle: String? { get }
}

public protocol WXNotice {
    
    var attributedText: [NSAttributedString.Key: Any] { get }
    
}
