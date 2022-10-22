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
                
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .foregroundColor(.theme.primaryLabel)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            }
            .padding()
            
            List {
                Picker(selection: $viewModel.selectedCountry) {
                    ForEach(viewModel.countries) { country in
                        Text(country.name)
                            .tag(country)
                            .foregroundColor(.theme.primaryLabel)
                    }
                } label: {
                    countryText
                }
                
                Picker(selection: $viewModel.selectedCategory) {
                    ForEach(viewModel.categories) { category in
                        Text(category.rawValue)
                            .tag(category)
                            .foregroundColor(.theme.primaryLabel)
                    }
                } label: {
                    categoryText
                }
            }
            .listStyle(.plain)
            
            Spacer(minLength: 0)
            
            Button {
                viewModel.apply()
                presentationMode.wrappedValue.dismiss()
            } label: {
                ZStack {
                    Text("Apply".uppercased())
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.theme.accent)
                .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .onAppear {
            viewModel.prepareDataSource()
        }
    }
    
    private var countryText: some View {
        HStack(spacing: 8) {
            Text("Country:")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.theme.primaryLabel)
            
            Text("\(viewModel.selectedCountry == .allCountry ? "Any" : viewModel.selectedCountry.name)")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.theme.primaryLabel.opacity(0.75))
        }
    }
    
    private var categoryText: some View {
        HStack(spacing: 8) {
            Text("Category:")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.theme.primaryLabel)
            
            Text("\(viewModel.selectedCategory == .general ? "All" : viewModel.selectedCategory.rawValue)")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.theme.primaryLabel.opacity(0.75))
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(viewModel: FilterViewModel())
    }
}
