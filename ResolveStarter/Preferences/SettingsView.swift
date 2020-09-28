//
//  SettingsView.swift
//  ResolveStarter
//
//  Created by Julian Lopes Hinz on 24.09.20.
//  Copyright © 2020 Julian Lopes Hinz. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settings: Settings
    @State var settingsWindowDelegate = SettingsWindowDelegate()
    
    private enum Tabs: Hashable {
        case general, advanced
    }
    
    var body: some View {
        TabView {
            GeneralSettingsView(settings: settings)
                .tabItem {
                    //Label("General", systemImage: "gear")
                    Text("General")
                }
                .tag(Tabs.general)
            /*AdvancedSettingsView()
                .tabItem {
                    //Label("Advanced", systemImage: "star")
                }
                .tag(Tabs.advanced)*/
        }
        .padding(20)
        .frame(width: 500, height: 150)
    }
    
    var window: NSWindow!
    init(settings: Settings) {
        self.settings = settings
        
        window = NSWindow.createStandardWindow(withTitle: "Preferences",
                                               width: 300,
                                               height: 100)
        window.contentView = NSHostingView(rootView: self)
        window.delegate = settingsWindowDelegate
        window.tabbingMode = .disallowed
        settingsWindowDelegate.windowIsOpen = true
        window.makeKeyAndOrderFront(nil)
    }
    
    class SettingsWindowDelegate: NSObject, NSWindowDelegate {
        var windowIsOpen = false
        
        func windowWillClose(_ notification: Notification) {
            windowIsOpen = false
        }
    }
}

/*
struct SettingsView_Previews: PreviewProvider {
    static var settings: some View {
        return SettingsView(settings: Settings())
    }
}
*/

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settings: Settings())
    }
}
