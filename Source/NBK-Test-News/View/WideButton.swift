//
//  WideButton.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 22/10/2022.
//

import SwiftUI

public struct WideButton: View {
    public var title: String
    public var action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            Text(title.uppercased())
        }
        .buttonStyle(WideButtonStyle())
    }
}

fileprivate struct WideButtonStyle: ButtonStyle {
    private let scaleSize: CGFloat = 0.98
    private let cornerRadius: CGFloat = 10
    private let height: CGFloat = 56
    
    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(Color.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: height)
        .background(configuration.isPressed
                    ? Color.theme.accent.opacity(0.95)
                    : Color.theme.accent)
        .cornerRadius(cornerRadius)
        .scaleEffect(
            x: configuration.isPressed ? scaleSize : 1,
            y: configuration.isPressed ? scaleSize : 1)
    }
}

struct WideButton_Previews: PreviewProvider {
    static var previews: some View {
        WideButton(title: "TAP ME", action: {})
    }
}
