//
//  MenubarAppApp.swift
//  MenubarApp
//
//  Created by Bumseok on 20210402.
//

import SwiftUI

@main
struct MenubarAppApp: App {

    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate
{
    var popover = NSPopover()
    var statusBarItem: NSStatusItem?

    func applicationDidFinishLaunching(_ notification: Notification) {

        popover.behavior = .transient
        popover.contentViewController = NSViewController()
        popover.contentViewController?.view = NSHostingView(rootView: ContentView())

        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        if let button = statusBarItem?.button {
            // Use system icon
            button.image = NSImage(named: NSImage.slideshowTemplateName)
            button.action = #selector(togglePopover(_:))
        }
    }

    @objc func togglePopover(_ sender: AnyObject?) {

        if popover.isShown {
            popover.performClose(sender)
        }
        else {
            if let button = statusBarItem?.button {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }

}
