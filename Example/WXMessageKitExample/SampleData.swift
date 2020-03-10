//
//  SampleData.swift
//  WXMessageKitExample
//
//  Created by xushuifeng on 2020/3/8.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import Foundation
import WXMessageKit

struct SampleData {
    
    static let shared = SampleData()
    
    private init() {}
    
    func messages() -> [Message] {
        let m1 = Message(formatTime: "2020-02-02", content: textContent(), messageId: "1", isOutgoing: true)
        let m2 = Message(formatTime: nil, content: imageContent(), messageId: "2", isOutgoing: false)
        let m3 = Message(formatTime: "2020-02-02", content: textContent(), messageId: "3", isOutgoing: true)
        let m4 = Message(formatTime: nil, content: emoticonContent(), messageId: "4", isOutgoing: false)
        let m5 = Message(formatTime: "2020-02-02", content: textContent(), messageId: "5", isOutgoing: true)
        return [m1, m2, m3, m4, m5]
    }
    
    private func text() -> Message {
        return Message(formatTime: nil, content: .text("Hello world"), messageId: "11", isOutgoing: true)
    }
    
    private func textContent() -> WXMessageContent {
        return .text("Hello world")
    }
    
    private func imageContent() -> WXMessageContent {
        let media = Media(url: URL(string: "https://ww3.sinaimg.cn/bmiddle/007y3qHCly1gcnbt2rq2aj30ku1121kx.jpg"))
        return .image(media)
    }
    
    private func emoticonContent() -> WXMessageContent {
        let url = Bundle.main.url(forResource: "emoticon", withExtension: "pic")
        var thumb: UIImage? = nil
        if let path = Bundle.main.path(forResource: "emoticon.pic", ofType: "thumb") {
            thumb = UIImage(contentsOfFile: path)
        }
        let emoticon = Emoticon(thumbnail: thumb, url: url)
        return .emoticon(emoticon)
    }
}
