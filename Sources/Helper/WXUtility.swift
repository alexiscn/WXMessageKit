//
//  WXUtility.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/8.
//

import UIKit

class WXUtility {
    
    static var bundle: Bundle? = {
        if let url = Bundle(for: WXUtility.self).url(forResource: "Media", withExtension: "bundle") {
            return Bundle(url: url)
        }
        return nil
    }()
    
    static func image(named: String) -> UIImage? {
        return UIImage(named: named, in: bundle, compatibleWith: nil)
    }
}