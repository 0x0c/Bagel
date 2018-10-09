//
//  ResponseDataViewModel.swift
//  Bagel
//
//  Created by Yagiz Gurgul on 2.10.2018.
//  Copyright © 2018 Yagiz Lab. All rights reserved.
//

import Cocoa

class ResponseDataViewModel: DataViewModel {

    override func didSelectPacket() {
        
        super.didSelectPacket()
        self.data = self.packet?.requestInfo?.responseData?.base64Data
        self.onChange?()
    }
}
