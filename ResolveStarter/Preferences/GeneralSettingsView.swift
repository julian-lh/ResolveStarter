//
//  GeneralSettingsView.swift
//  ResolveStarter
//
//  Created by Julian Lopes Hinz on 24.09.20.
//  Copyright © 2020 Julian Lopes Hinz. All rights reserved.
//

import SwiftUI

struct GeneralSettingsView: View {
    @State private var showPreview = true
    @State private var fontSize = 12.0
    @ObservedObject var settings: Settings

    func fileManager() -> String {
        let dialog = NSOpenPanel();
           
        dialog.title                   = "Choose a Volume or Directory";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.canChooseFiles          = true
        dialog.allowsMultipleSelection = false;
        dialog.directoryURL = NSURL.fileURL(withPath: "/Volumes/", isDirectory: true)

        var path = ""
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            let result = dialog.url // Pathname of the file
               
               if (result != nil) {
                path = result!.path
               }
           }
        return path
    }
    
    
    var body: some View {
        
        Form{
            HStack(){
                Toggle("Use Custom Path 1", isOn: $settings.useDirectoryOne)
                TextField("/Volumes/VOLUME_NAME1", text: $settings.directoryOne)
                    .disabled(!settings.useDirectoryOne)
                    .opacity(!settings.useDirectoryOne ? /*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/ : 1.0)
                Button(action: {self.settings.directoryOne = String(self.fileManager())}) {
                    Text("⚲").rotationEffect(.degrees(-45.0))
                }
            }
            HStack(){
                Toggle("Use Custom Path 2", isOn: $settings.useDirectoryTwo)
                TextField("/Volumes/VOLUME_NAME2", text: $settings.directoryTwo)
                    .disabled(!settings.useDirectoryTwo)
                    .opacity(!settings.useDirectoryTwo ? /*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/ : 1.0)
                Button(action:{self.settings.directoryTwo = String(self.fileManager())}) {
                    Text("⚲").rotationEffect(.degrees(-45.0))
                }
            }
        }
        .padding(20)
        //.frame(width: 350, height: 100)
    }
}
struct GeneralSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsView(settings: Settings())
    }
}
