
//
//  Settings.swift
//  ResolveStarter
//
//  Created by Julian Lopes Hinz on 24.09.20.
//  Copyright © 2020 Julian Lopes Hinz. All rights reserved.
//

import Foundation

class Settings: ObservableObject {
    
    /*
    @Published var showCopyright: Bool = UserDefaults.standard.bool(forKey: "showCopyright") {
        didSet {
            UserDefaults.standard.set(self.showCopyright, forKey: "showCopyright")
        }
    }*/
    @Published var useDirectoryOne: Bool = UserDefaults.standard.bool(forKey: "UseDirectoryOne") {
        didSet {
            UserDefaults.standard.set(self.useDirectoryOne, forKey: "UseDirectoryOne")
        }
    }
    @Published var useDirectoryTwo: Bool = UserDefaults.standard.bool(forKey: "UseDirectoryTwo") {
        didSet {
            UserDefaults.standard.set(self.useDirectoryTwo, forKey: "UseDirectoryTwo")
        }
    }
    
    @Published var directoryOne: String = UserDefaults.standard.object(forKey: "directoryOne") as? String ?? String() {
        didSet {
            UserDefaults.standard.set(self.directoryOne, forKey: "directoryOne")
        }
    }
    @Published var directoryTwo: String = UserDefaults.standard.object(forKey: "directoryTwo") as? String ?? String(){
        didSet {
            UserDefaults.standard.set(self.directoryTwo, forKey: "directoryTwo")
        }
    }
    
}
