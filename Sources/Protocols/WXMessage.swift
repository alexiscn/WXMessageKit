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

public enum WXMessageContent {
    case text(String)
    case image(WXMedia)
    case video(WXMedia)
    case emoticon(WXEmoticon)
    case voice(WXVoice)
    case location(WXLocation)
    case custom(Any)
}

public protocol WXMedia {
    
    var size: CGSize { get }
    
    var image: UIImage? { get }
    
    var url: URL? { get }
    
}

public protocol WXEmoticon {
 
    var thumbnail: UIImage? { get }
    
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
