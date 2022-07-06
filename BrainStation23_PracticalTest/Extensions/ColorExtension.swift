//
//  ColorExtension.swift
//  BrainStation23_PracticalTest
//
//  Created by Md. Abdur Rouf on 6/7/22.
//

import Foundation
import SwiftUI

extension Color{
    static let theme = ThemeColors()
}

struct ThemeColors{
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let primaryText = Color("PrimaryTextColor")
    let secondaryText = Color("SecondaryTextColor")
    let controllBackground = Color("ControlBackgroundColor")
    let hintTextColor = Color("HintTextColor")
}
