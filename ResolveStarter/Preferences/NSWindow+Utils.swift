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
