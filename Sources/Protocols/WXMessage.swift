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
    case image(WXImageItem)
    
    /// A video message.
    case video(WXVideoItem)
    
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

public protocol WXImageItem {
    
    /// The display size of the image. `.zero` by default, which use `preferredSize` in each content node.
    var size: CGSize { get }
    
    /// The image.
    var image: UIImage? { get }
    
    /// The url where image is located.
    var url: URL? { get }
}

public protocol WXVideoItem {
    
    /// The display size of the video. `.zero` by default, which use `preferredSize` in each content node.
    var size: CGSize { get }
    
    var thumbnail: UIImage? { get }
    
    /// The url where video is located.
    var url: URL? { get }
    
    /// The length of the video.
    var duration: TimeInterval { get }
}

public protocol WXEmoticon {
 
    /// The thumbnail for emoticon. Can be `nil`.
    var thumbnail: UIImage? { get }
    
    /// The url of emoticon file. Eihter remote file or local file.
    var url: URL? { get }
}

public protocol WXVoice {
    
    /// The length of the voice.
    var duration: TimeInterval { get }
    
    /// The url where voice is located.
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
