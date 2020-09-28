//
//  NSWindow+Utils.swift
//  ResolveStarter
//
//  Created by Julian Lopes Hinz on 24.09.20.
//  Copyright © 2020 Julian Lopes Hinz. All rights reserved.
//

import SwiftUI

extension NSWindow {
    
    static func createStandardWindow(withTitle title: String,
                                     width: CGFloat = 800, height: CGFloat = 600) -> NSWindow {
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: width, height: height),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.title = title
        return window
    }
    
}
extension String {
    func deletePrefix() -> String {
        var result = self
        if result.hasPrefix("/Volumes/"){
            result = String(result.dropFirst("/Volumes/".count))
        }else {/*
            while result.hasPrefix("/"){
                result = String(result.dropFirst("/".count))
            }*/
            while let index = result.range(of: "/")?.upperBound{
                result = String(result[index...])
            }
        }
        return result
    }
}
