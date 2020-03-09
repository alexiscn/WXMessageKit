# WXMessageKit

Status: On-Working



## Requirements

- iOS 12.0+
- Xcode 11.0+
- Swift 5.0+

## Installation

`WXMessageKit` is available through CocoaPods. To install it, simply add the following line to your Podfile:

```
use_frameworks!

pod 'WXMessageKit'
```



## Get Started

`WXMessage` protocol represents the message type.

```swift
public protocol WXMessage {
    
    var messageId: String { get set }
    
    var content: WXMessageContent { get set }
    
    var isOutgoing: Bool { get set }
    
    var formatTime: String? { get }
}
```



`WXSession` protocol represents the session type, which passed to the `WXMessageViewController`.

```swift
public protocol WXSession {
 
    var sessionId: String { get set }
}
```



`WXMessageDataSource` protocol represents the data source of your chat.

```swift
public protocol WXMessageDataSource {
    
    func numberOfMessages() -> Int
    
    func message(at index: Int) -> WXMessage
    
}
```



`WXMessageContent` represents the actual content of the message.

```swift
public enum WXMessageContent {
    case text(String)
    case image(WXMediaContent)
    case emoticon(WXEmoticon)
    case voice(WXVoice)
    case custom(Any?)
}
```





Supported Content Type

* Text
* Image
* Video
* Voice
* Emoticon
* And so on
* System Notice



## Content Type



#### Text

```swift
WXMessageContent.text(String)
```



![](Assets/Content_Text@2x.jpg)



#### Image



Conformt to `WXMediaContent` protocol

```swift
struct Media: WXMediaContent {
    
    var size: CGSize
    
    var image: UIImage?
    
    var url: URL?
}
```



`WXMessageContent.image(media)`



#### Voice



#### Customize content node

You can inherit `WXContentNode` to create your own content node. It must be assoicated with `WXMediaContent`.



## Configuration

TO BE DONE

