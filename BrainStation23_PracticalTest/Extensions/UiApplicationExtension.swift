//
//  UiApplicationExtension.swift
//  BrainStation23_PracticalTest
//
//  Created by Md. Abdur Rouf on 6/7/22.
//

import Foundation
import SwiftUI

extension UIApplication {
    //Keyboard hide extension method
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

