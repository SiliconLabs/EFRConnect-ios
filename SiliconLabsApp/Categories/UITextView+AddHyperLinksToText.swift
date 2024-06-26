//
//  UITextView+AddHyperLinksToText.swift
//  BlueGecko
//
//  Created by Grzegorz Janosz on 18/03/2021.
//  Copyright © 2021 SiliconLabs. All rights reserved.
//

extension UITextView {

  func addHyperLinksToText(originalAttributedText: NSAttributedString, hyperLinks: [String: String]) {
    let fontAttribute = [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)
    ]
    let attributedOriginalText = NSMutableAttributedString(string: originalAttributedText.string, attributes: fontAttribute)
    for (hyperLink, urlString) in hyperLinks {
        let linkRange = attributedOriginalText.mutableString.range(of: hyperLink)
        attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: urlString, range: linkRange)
    }

    self.linkTextAttributes = [
        NSAttributedString.Key.foregroundColor: UIColor.sil_strongBlue()
    ]
    self.attributedText = attributedOriginalText
  }
}
