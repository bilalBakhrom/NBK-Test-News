//
//  ActivityIndicator.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 21/10/2022.
//

import SwiftUI

public struct ActivityIndicator: UIViewRepresentable {
    public typealias UIView = UIActivityIndicatorView
    public var isAnimating: Bool
    public var configuration = { (indicator: UIView) in }
    
    public func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView {
        return UIView()
    }
    
    public func updateUIView(_ indicator: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? indicator.startAnimating() : indicator.stopAnimating()
        configuration(indicator)
    }
}
