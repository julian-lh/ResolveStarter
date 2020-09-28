//
//  ContentView.swift
//  ResolveStarter
//
//  Created by Julian Lopes Hinz on 10.09.20.
//  Copyright © 2020 Julian Lopes Hinz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //var missingDirectories: [String]
    @ObservedObject var directoryManager: DirectoryManager
    
    fileprivate func errorIcon() -> some View {
        return Circle()
            .fill(Color.red)
            .frame(width: 25.0, height: 25.0)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .overlay(Text("!").font(.headline).foregroundColor(Color.white).multilineTextAlignment(.center))
    }
    
    fileprivate func greenIcon() -> some View {
        return Circle()
            .fill(Color.green)
            .frame(width: 25.0, height: 25.0)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .overlay(Text("✓").font(.headline).foregroundColor(Color.white).multilineTextAlignment(.center))
        
        
    }
    
    fileprivate func driveIcon(label:String, connected: Bool) -> some View {
        return ZStack{
            VStack(){
                Image("DriveIcon")
                    .resizable()
                    .frame(width: 70.0, height: 70.0, alignment: .center)
                    
                Text(label)
                    .font(.caption)
            }
            .grayscale(connected ? 0.0 : 0.9)
            .opacity(connected ? 1.0 : 0.6)
            HStack(){
                if !connected{
                    errorIcon()
                        .offset(x:20, y: -38)
                        .transition(.opacity)
                }else{
                    greenIcon()
                        .offset(x:20, y: -38)
                        .transition(.opacity)
                }
            }.animation(.easeInOut)
        }
    }
    
    var body: some View {
        VStack(spacing: 25){
            
            HStack(){
                Image("ResolveIcon")
                .resizable()
                    .frame(width: 60.0, height: 60.0)
                    .padding(.trailing,15)
                    .offset(y: -0)
                    
                VStack(alignment: .leading){
                    Text("Drive is missing!")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 8)
                        
                    Text("Please check all necessary connections:")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                    }
            }

            
            HStack(spacing: 30){
                driveIcon(label: "Babo/raw", connected: directoryManager.rawConnected)
                driveIcon(label: "Resolve-Framestore", connected: directoryManager.framestoreConnected)
                
            }.transition(.opacity)
            
           
            HStack(){
                Button(action: {NSApplication.shared.terminate(self)}) {
                    Text("Close")
                }
                
                Button(action: {
                    if(self.directoryManager.rawConnected && self.directoryManager.framestoreConnected){
                        NSWorkspace.shared.launchApplication("DaVinci Resolve")
                        NSApplication.shared.terminate(self)
                    }
                }) {
                    Text("Open DaVinci Resolve")
                }.disabled(!(self.directoryManager.rawConnected && self.directoryManager.framestoreConnected))
            }
        }.frame(minWidth: 450, idealWidth: 550, minHeight: 250, idealHeight: 400)
            
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let directoryManager = DirectoryManager(settings: Settings())
        return ContentView(directoryManager: directoryManager)
    }
}
