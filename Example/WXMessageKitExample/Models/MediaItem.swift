//
//  Media.swift
//  WXMessageKitExample
//
//  Created by xushuifeng on 2020/3/9.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import Foundation
import WXMessageKit

struct MediaItem: WXMediaItem {
    
    var size: CGSize
    
    var image: UIImage?
    
    var url: URL?
    
    init(image: UIImage?) {
        self.image = image
        self.size = image?.size ?? .zero
        self.url = nil
    }
    
    init(url: URL?) {
        self.image = nil
        self.size = .zero
        self.url = url
    }
}
