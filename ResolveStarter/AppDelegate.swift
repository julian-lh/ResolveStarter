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
    var settingsView: SettingsView?
    let settings = Settings()
    
    func openApp(_ named: String) -> Bool {
        return NSWorkspace.shared.launchApplication(named)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let directoryManager = DirectoryManager(settings: settings)
        if (directoryManager.rawConnected && directoryManager.framestoreConnected) {
            if openApp("DaVinci Resolve") {
                print(true)
            }
            NSApplication.shared.terminate(self)
        }else{
            
            UserDefaults.standard.register(defaults: [
            "UseDirectoryOne": true,
            "UseDirectoryTwo": true,
            "directoryOne": "/Volumes/raw",
            "directoryTwo": "/Volumes/Resolve-Framestore"
            ])
            
            // Create the SwiftUI view that provides the window contents.
            let contentView = ContentView(directoryManager: directoryManager, settings: settings)
            
            // Create the window and set the content view.
            window = NSWindow(
                contentRect: NSRect(x: 0, y: 0, width: 800, height: 600),
                styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
                backing: .buffered, defer: false)
            window.center()
            window.title = "ResolveStarter - NO QUICKTIME!1!"
            window.setFrameAutosaveName("Main Window")
            window.contentView = NSHostingView(rootView: contentView.environmentObject(settings))
            window.makeKeyAndOrderFront(nil)
            
        }
        
        
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    @IBAction func preferencesClicked(_ sender: Any) {
        if let settingsView = settingsView, settingsView.settingsWindowDelegate.windowIsOpen {
            settingsView.window.makeKeyAndOrderFront(self)
        } else {
            settingsView = SettingsView(settings: settings)
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

