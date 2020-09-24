//
//  AppDelegate.swift
//  ResolveStarter
//
//  Created by Julian Lopes Hinz on 10.09.20.
//  Copyright © 2020 Julian Lopes Hinz. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func openApp(_ named: String) -> Bool {
        return NSWorkspace.shared.launchApplication(named)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let directoryManager = DirectoryManager()
        if (directoryManager.rawConnected && directoryManager.framestoreConnected) {
            if openApp("DaVinci Resolve") {
                print(true)
            }
            NSApplication.shared.terminate(self)
        }else{
            
            // Create the SwiftUI view that provides the window contents.
            let contentView = ContentView(directoryManager: directoryManager)
            
            // Create the window and set the content view.
            window = NSWindow(
                contentRect: NSRect(x: 0, y: 0, width: 800, height: 600),
                styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
                backing: .buffered, defer: false)
            window.center()
            window.setFrameAutosaveName("Main Window")
            window.contentView = NSHostingView(rootView: contentView)
            window.makeKeyAndOrderFront(nil)
            
        }
        
        
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

