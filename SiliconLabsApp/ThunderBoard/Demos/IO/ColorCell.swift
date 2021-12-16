//
//  ColorCell.swift
//  Thunderboard
//
//  Created by Jan Wisniewski on 12/02/2020.
//  Copyright © 2020 Silicon Labs. All rights reserved.
//

import UIKit

@IBDesignable
class ColorCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var colorSlider: ColorSlider!
    
    @IBAction func colorChanged(_ sender: ColorSlider) {
    }
    
}
