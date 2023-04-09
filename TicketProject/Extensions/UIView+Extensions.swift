//
//  UIView+Extensions.swift
//  TicketProject
//
//  Created by Melike Yayla on 8.04.2023.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius : CGFloat{
        get {return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
