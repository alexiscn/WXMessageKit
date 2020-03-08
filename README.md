# WXMessageKit

Status: On-Working



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

#### Image





## Configuration

TO BE DONE