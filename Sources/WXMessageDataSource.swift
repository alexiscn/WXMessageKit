//
//  WXMessageDataSource.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import Foundation

public protocol WXMessageDataSource {
    
    func numberOfMessages() -> Int
    
    func message(at index: Int) -> WXMessage
    
}
