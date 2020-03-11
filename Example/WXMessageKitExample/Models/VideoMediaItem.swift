//
//  VideoMediaItem.swift
//  WXMessageKitExample
//
//  Created by xushuifeng on 2020/3/11.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import WXMessageKit

struct VideoMediaItem: WXVideoItem {
    
    var size: CGSize
    
    var thumbnail: UIImage?
    
    var url: URL?
    
    var duration: TimeInterval
    
}
