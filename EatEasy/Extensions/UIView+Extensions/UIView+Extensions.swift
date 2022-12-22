//
//  UIView+Extensions.swift
//  EatEasy
//
//  Created by Jaqueline Oliveira on 24/04/22.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

