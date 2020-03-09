//
//  Media.swift
//  WXMessageKitExample
//
//  Created by xushuifeng on 2020/3/9.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import Foundation
import WXMessageKit

struct Media: WXMediaContent {
    
    var size: CGSize
    
    var image: UIImage?
    
    var url: URL?
}
