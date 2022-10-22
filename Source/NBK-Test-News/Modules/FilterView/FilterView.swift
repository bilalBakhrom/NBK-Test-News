//
//  FilterView.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 22/10/2022.
//

import SwiftUI

public struct FilterView: View {
    @ObservedObject public var viewModel: FilterViewModel
    @Environment(\.presentationMode) private var presentationMode
    
    public var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                
                CloseButton {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .padding()
            
            FilterListForm(viewModel: viewModel)
            
            Spacer(minLength: 0)
            
            WideButton(title: "Apply") {
                viewModel.apply()
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.horizontal)
        }
        .onAppear {
            viewModel.prepareDataSource()
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(viewModel: FilterViewModel())
    }
}
