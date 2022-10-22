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
        GeometryReader { geometry in
            ZStack {
                resource.hasResource { image in
                    ZStack {
                        Image(image)
                            .scaledToFill()
                        
                        VStack {
                            Rectangle()
                                .fill(LinearGradient(
                                    colors: [Color.black.opacity(0.5), Color.black.opacity(0.0)],
                                    startPoint: .top,
                                    endPoint: .bottom)
                                )
                                .frame(height: geometry.size.height * 0.4)
                            
                            Spacer()
                        }
                    }
                }
                
                resource.isLoading {
                    ActivityIndicator(isAnimating: resource.loading)
                }
            }
            .background(Color.theme.primaryBackground)
        }
    }
}
