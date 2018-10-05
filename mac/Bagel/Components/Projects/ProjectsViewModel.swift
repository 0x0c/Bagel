//
//  ProjectsViewModel.swift
//  Bagel
//
//  Created by Yagiz Gurgul on 30/08/2018.
//  Copyright © 2018 Yagiz Lab. All rights reserved.
//

import Cocoa

class ProjectsViewModel: BaseListViewModel<BagelProjectController> {

    func register() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didGetPacket), name: NSNotification.Name(rawValue: "DidGetPacket"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didGetPacket), name: NSNotification.Name(rawValue: "DidSelectProject"), object: nil)
    }
    
    @objc func didGetPacket() {
        
        self.items = BagelController.shared.projectControllers
        self.onChange?()
    }
}
