//
//  Color+Addition.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import SwiftUI

private let uiKitPalette = ThemePaletteForUIColor()
private let swiftUIPalette = ThemePaletteForColor()

extension UIColor {
    public static var theme: ThemePaletteForUIColor { uiKitPalette }
}

extension Color {
    public static var theme: ThemePaletteForColor { swiftUIPalette }
}
