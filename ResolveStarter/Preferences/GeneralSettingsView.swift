//
//  GeneralSettingsView.swift
//  ResolveStarter
//
//  Created by Julian Lopes Hinz on 24.09.20.
//  Copyright © 2020 Julian Lopes Hinz. All rights reserved.
//

import SwiftUI

struct GeneralSettingsView: View {
    /*@AppStorage("showPreview")*/ @State private var showPreview = true
    /*@AppStorage("fontSize")*/ @State private var fontSize = 12.0
    @ObservedObject var settings: Settings

    var body: some View {
        /*Form {
            Toggle("Activate", isOn: settings.)
            Slider(value: $fontSize, in: 9...96) {
                Text(settings.DirectoryOne)
            }
        }
        .padding(20)
        .frame(width: 350, height: 100)*/
        Form{
            HStack(){
                TextField("/Volumes/VOLUME_NAME1", text: $settings.directoryOne)
                Toggle("Activate", isOn: $settings.useDirectoryOne)
            }
            HStack(){
                TextField("/Volumes/VOLUME_NAME2", text: $settings.directoryTwo)
                Toggle("Activate", isOn: $settings.useDirectoryTwo)
            }
        }
        .padding(20)
        .frame(width: 350, height: 100)
    }
}
struct GeneralSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsView(settings: Settings())
    }
}
