//
//  PacketViewModel.swift
//  Bagel
//
//  Created by Yagiz Gurgul on 1.10.2018.
//  Copyright © 2018 Yagiz Lab. All rights reserved.
//

import Cocoa

class PacketsViewModel: BaseListViewModel<BagelPacket>  {

    var filterTerm = "" {
        didSet {
            self.refreshItems()
        }
    }
    
    func register() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshItems), name: NSNotification.Name(rawValue: "DidGetPacket"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshItems), name: NSNotification.Name(rawValue: "DidSelectDevice"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshItems), name: NSNotification.Name(rawValue: "DidSelectProject"), object: nil)
    }
    
    
    var selectedItem: BagelPacket? {
        
        return BagelController.shared.selectedProjectController?.selectedDeviceController?.selectedPacket
    }
    
    
    var selectedItemIndex: Int? {
        
        if let selectedItem = self.selectedItem {
            
            return self.items.firstIndex { $0 === selectedItem }
        }
        
        return nil
    }
    
    @objc func refreshItems() {
        
        self.filter(items: BagelController.shared.selectedProjectController?.selectedDeviceController?.packets ?? [])
        self.onChange?()
    }
    
    func filter(items: [BagelPacket]?) {
        
        if let items = items, filterTerm.count > 0 {
            
            self.items = items.filter({ (packet) -> Bool in
                
                return packet.requestInfo?.url?.contains(self.filterTerm) ?? true
            })
            
        }else{
            
            self.items = BagelController.shared.selectedProjectController?.selectedDeviceController?.packets ?? []
        }
    }
    
    func clearPackets() {
        
        BagelController.shared.selectedProjectController?.selectedDeviceController?.clear()
        self.refreshItems()
    }
}
