//
//  SILGattConfiguratorCharacteristicShadowCellView.swift
//  BlueGecko
//
//  Created by Grzegorz Janosz on 25/03/2021.
//  Copyright © 2021 SiliconLabs. All rights reserved.
//

import Foundation

class SILGattConfiguratorCharacteristicShadowCellView: SILCell, SILCellView {
    
    private var viewModel: SILGattConfiguratorCharacteristicShadowCellViewModel?
    
    @IBOutlet weak var shadowView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shadowView.addShadow(withOffset: SILCellShadowOffset,
                  radius: SILCellShadowRadius)
    }
    
    override func prepareForReuse() {
        viewModel = nil
    }
    
    func setViewModel(_ viewModel: SILCellViewModel) {
        self.viewModel = (viewModel as! SILGattConfiguratorCharacteristicShadowCellViewModel)
    }
}
