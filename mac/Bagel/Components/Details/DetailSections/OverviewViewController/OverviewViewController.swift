//
//  DetailOverviewViewController.swift
//  Bagel
//
//  Created by Yagiz Gurgul on 1.10.2018.
//  Copyright © 2018 Yagiz Lab. All rights reserved.
//

import Cocoa
import macOSThemeKit

class OverviewViewController: BaseViewController {

    @IBOutlet var overviewTextView: NSTextView!
    
    @IBOutlet weak var copyToClipboardButton: NSButton!
    
    var viewModel: OverviewViewModel?
    
    override func setup() {
        
        self.copyToClipboardButton.image = ThemeImage.copyToClipboardIcon
        
        self.viewModel?.onChange = { [weak self] in
            
            self?.refresh()
        }
        
        self.refresh()
    }
    
    
    func refresh() {
        
        if let overviewText = self.viewModel?.overviewRepresentation?.rawString {
           
            let attributedOverviewText = TextStyles.codeAttributedString(string: overviewText)
            
            self.overviewTextView.textStorage?.setAttributedString(attributedOverviewText)
        }
    }
    
    @IBAction func copyButtonAction(_ sender: Any) {
        
        self.viewModel?.copyToClipboard()
    }
}
