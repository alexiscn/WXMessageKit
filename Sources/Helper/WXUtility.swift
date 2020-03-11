//
//  WXUtility.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/8.
//

import UIKit

class WXUtility {
    
    static let screenHeight = UIScreen.main.bounds.height
    
    static let screenWidth = UIScreen.main.bounds.width
    
    static let lineHeight = 1 / UIScreen.main.scale
    
    static var bundle: Bundle? = {
        if let url = Bundle(for: WXUtility.self).url(forResource: "Media", withExtension: "bundle") {
            return Bundle(url: url)
        }
        return nil
    }()
    
    static func imageNamed(_ name: String) -> UIImage? {
        return UIImage(named: name, in: bundle, compatibleWith: nil)
    }
    
    static let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.calendar = Calendar(identifier: .chinese)
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        return formatter
    }()
    
    static func formatDuration(_ duration: TimeInterval) -> String {
        if let text = durationFormatter.string(from: duration) {
            if text.count == 3 {
                return "0" + text
            }
            return text
        }
        return ""
    }
}
