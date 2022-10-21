//
//  BottomSheetView.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 20/10/2022.
//

import SwiftUI

fileprivate enum Constants {
    static let radius: CGFloat = 16
    static let indicatorHeight: CGFloat = 4
    static let indicatorWidth: CGFloat = 40
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0.3
}

public struct BottomSheetView<Content: View>: View {
    @Binding public var isOpen: Bool
    public let maxHeight: CGFloat
    public let minHeight: CGFloat
    public let content: Content
    
    @GestureState private var translation: CGFloat = 0
    
    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }
    
    private var indicator: some View {
        RoundedRectangle(cornerRadius: Constants.radius)
            .fill(Color.black)
            .frame(
                width: Constants.indicatorWidth,
                height: Constants.indicatorHeight
            )
            .blendMode(.overlay)
            .onTapGesture {
                withAnimation {
                    isOpen.toggle()
                }
            }
    }
    
    public init(
        isOpen: Binding<Bool>,
        maxHeight: CGFloat,
        minHeight: CGFloat = UIScreen.main.bounds.height * 0.45,
        @ViewBuilder content: () -> Content
    ) {
        self.maxHeight = maxHeight
        self.minHeight = minHeight
        self.content = content()
        self._isOpen = isOpen
    }
    
    public var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                indicator
                    .padding()
                
                content
            }
            .frame(width: geometry.size.width, height: maxHeight, alignment: .top)
            .background(Color.theme.secondaryBackground)
            .cornerRadius(Constants.radius)
            .clipped()
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(offset + translation, 0))
            .animation(.linear(duration: 0.2), value: translation)
            .gesture(
                DragGesture()
                    .updating($translation) { value, state, _ in
                        state = value.translation.height
                    }
                    .onEnded { value in
                        let snapDistance = maxHeight * Constants.snapRatio
                        guard abs(value.translation.height) > snapDistance else {
                            return
                        }
                        
                        isOpen = value.translation.height < 0
                    }
            )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    @State static private var bottomSheetShown = false
    
    static var previews: some View {
        ZStack {
            BottomSheetView(
                isOpen: $bottomSheetShown,
                maxHeight: UIScreen.main.bounds.height - 100,
                minHeight: 400
            ) {
                VStack {
                    Color.blue
                }
            }
            
        }
        .background(Color.gray)
    }
}
