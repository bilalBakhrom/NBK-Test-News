//
//  FilterListForm.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 22/10/2022.
//

import SwiftUI

public struct FilterListForm: View {
    @ObservedObject public var viewModel: FilterViewModel
    
    public var body: some View {
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
    }
}

extension FilterListForm {
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

struct FilterListForm_Previews: PreviewProvider {
    static var previews: some View {
        FilterListForm(viewModel: FilterViewModel())
    }
}
