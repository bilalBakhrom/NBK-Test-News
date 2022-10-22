//
//  CloseButton.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 22/10/2022.
//

import SwiftUI

public struct CloseButton: View {
    public var action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .resizable()
        }
        .buttonStyle(CloseButtonStyle())
    }
}

fileprivate struct CloseButtonStyle: ButtonStyle {
    private let scaleSize: CGFloat = 0.98
    private let cornerRadius: CGFloat = 10
    private let height: CGFloat = 56
    
    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .opacity(0.85)
        }
        .frame(width: 28, height: 28)
        .foregroundColor(configuration.isPressed
                    ? Color.theme.primaryLabel.opacity(0.95)
                    : Color.theme.primaryLabel)
        .cornerRadius(cornerRadius)
        .scaleEffect(
            x: configuration.isPressed ? scaleSize : 1,
            y: configuration.isPressed ? scaleSize : 1)
    }
}


struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton(action: {})
    }
}
