//
//  DetailsBackgroundImage.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 21/10/2022.
//

import SwiftUI
import NewsNetwork
import NukeUI

public struct DetailsBackgroundImage: View {
    @Binding public var resource: NResource<UIImage>
    
    public var body: some View {
        ZStack {
            resource.hasResource { image in
                Image(image)
                    .scaledToFill()
            }
            
            resource.isLoading {
                ActivityIndicator(isAnimating: resource.loading)
            }
        }
        .background(Color.theme.primaryBackground)
    }
}
