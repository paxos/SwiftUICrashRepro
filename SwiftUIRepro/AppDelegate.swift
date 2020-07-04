//
//  AppDelegate.swift
//  SwiftUIRepro
//
//  Created by Patrick Dinger on 7/4/20.
//  Copyright © 2020 Patrick Dinger. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        
        let section1 = MySection(title: "section 1", rows: [MyRow(title: "Row1.1")])
        let section2 = MySection(title: "section 2", rows: [MyRow(title: "Row2.1")])
        
        let contentView = ContentView(sections: [section1, section2])

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

