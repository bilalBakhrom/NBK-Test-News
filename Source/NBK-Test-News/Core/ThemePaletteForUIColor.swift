//
//  ThemePaletteForUIColor.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import SwiftUI

public struct ThemePaletteForUIColor {
    public var accent: UIColor {
        UIColor(named: "AccentColor")!
    }
    
    public var primaryBackground: UIColor {
        UIColor(named: "PrimaryBackground")!
    }
    
    public var secondaryBackground: UIColor {
        UIColor(named: "SecondaryBackground")!
    }
    
    public var primaryLabel: UIColor {
        UIColor(named: "PrimaryLabel")!
    }
    
    public var secondaryLabel: UIColor {
        UIColor(named: "SecondaryLabel")!
    }
}

public struct ThemePaletteForColor {
    public var accent: Color {
        Color("AccentColor")
    }
    
    public var primaryBackground: Color {
        Color("PrimaryBackground")
    }
    
    public var secondaryBackground: Color {
        Color("SecondaryBackground")
    }
    
    public var primaryLabel: Color {
        Color("PrimaryLabel")
    }
    
    public var secondaryLabel: Color {
        Color("SecondaryLabel")
    }
}
