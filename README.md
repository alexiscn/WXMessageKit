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



`WXSession` protocol represents the session type, which is passed to the `WXMessageViewController`.

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



Conformt to `WXMedia protocol

```swift
struct Media: WXMedia {
    
    var size: CGSize
    
    var image: UIImage?
    
    var url: URL?
}
```

![](Assets/Content_Image@2x.jpg)

`WXMessageContent.image(media)`



#### Voice



#### Customize content node

You can inherit `WXMessageContentNode` to create your own content node. It must be assoicated with `WXMessageContent`.



```swift
class MiniProgramContentNode: WXMessageContentNode {
    
    init(message: WXMessage, program: MiniProgram) {
        super.init(message: message)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASLayoutSpec()
    }
    
}
```





## Configuration

TO BE DONE



#### WXTextContentNode

```swift
public struct Constants {
        
        public static var senderEdgeInsets = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 15)
        
        public static var receiverEdgeInsets = UIEdgeInsets(top: 10, left: 17, bottom: 10, right: 12)
        
        /// The font of text cell. `UIFont.systemFont(ofSize: 17)` by default.
        public static var font = UIFont.systemFont(ofSize: 17)
        
        /// The text color. `black` by default.
        public static var textColor = UIColor.black
     
        public static var senderBubble = WXUtility.image(named: "ChatRoom_Bubble_Text_Sender_Green_57x40_")
        
        public static var receiverBubble = WXUtility.image(named: "ChatRoom_Bubble_Text_Receiver_White_57x40_")
}
```





#### 	WXImageContentNode
