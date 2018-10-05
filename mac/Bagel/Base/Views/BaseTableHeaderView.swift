//
//  BaseTableHeaderView.swift
//  Bagel
//
//  Created by Yagiz Gurgul on 1.10.2018.
//  Copyright © 2018 Yagiz Lab. All rights reserved.
//

import Cocoa

class BaseTableHeaderView: NSTableHeaderView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        self.layer?.borderColor = NSColor.white.cgColor
        self.layer?.borderWidth = 0
    }
    
}
