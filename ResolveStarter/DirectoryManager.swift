//
//  DirectoryManager.swift
//  ResolveStarter
//
//  Created by Julian Lopes Hinz on 11.09.20.
//  Copyright © 2020 Julian Lopes Hinz. All rights reserved.
//

import Foundation
import Cocoa

class DirectoryManager: ObservableObject {
    var missingDirectories = [String]()
    
    @Published var rawConnected = false
    @Published var framestoreConnected = false
    var settings = Settings()
    
    
    func checkConnection(atPath: String) -> Bool{
        var isConnected = false
        
        let fileManager = FileManager.default
        var isDir : ObjCBool = false
        
        if fileManager.fileExists(atPath: atPath, isDirectory:&isDir) {
            if isDir.boolValue {
                // file exists and is a directory
                //print("file exists and is a directory")
                isConnected = true
            }
        }
        return isConnected
    }
    
    
    func checkAllConnections(){
        var pathOne = "/Volumes/raw"
        if settings.useDirectoryOne {
            pathOne = settings.directoryOne
        }
        self.rawConnected = checkConnection(atPath: pathOne)
        
        var pathTwo = "/Volumes/Resolve-Framestore"
        if settings.useDirectoryTwo {
            pathTwo = settings.directoryTwo
        }
        self.framestoreConnected = checkConnection(atPath: pathTwo)
    }
    
    
    func allConnected() -> Bool {
       
        let directories = ["/Volumes/raw", "/Volumes/Resolve-Framestore"]
        
        var allDirsConnected = true
         
        //var missingDirectories = [String]()
        
        let fileManager = FileManager.default
       
        for directory in directories {
            
            var isDir : ObjCBool = false
            
            if fileManager.fileExists(atPath: directory, isDirectory:&isDir) {
                if isDir.boolValue {
                    // file exists and is a directory
                    print("file exists and is a directory")
                }
            } else {
                // file does not exist
                print("\(directory) does not exist")
                missingDirectories.append(String(directory.dropFirst(9)))
                allDirsConnected = false
            }
        }
        return allDirsConnected//(allDirsConnected, "test")
    }
    
    init(settings: Settings) {
        checkAllConnections()
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        self.settings = settings
    }
    @objc func update() {
        checkAllConnections()
    }
}
