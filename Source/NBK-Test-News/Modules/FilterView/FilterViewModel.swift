//
//  FilterViewModel.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 22/10/2022.
//

import Foundation

public class FilterViewModel: ObservableObject {
    @Published public var selectedCountry: Country
    @Published public var selectedCategory: NewsCategory
    @Published public var countries: [Country] = []
    @Published public var categories: [NewsCategory] = []
    private var onSelection: ((Country, NewsCategory) -> Void)?
    
    public init(country: Country = .allCountry, category: NewsCategory = .general) {
        self.selectedCountry = country
        self.selectedCategory = category
    }
    
    public func addObserver(_ block: @escaping (_ country: Country, _ category: NewsCategory) -> Void) {
        onSelection = block
    }
    
    public func apply() {
        onSelection?(selectedCountry, selectedCategory)
    }
    
    @MainActor
    public func prepareDataSource() {
        Task {
            countries = await fetchCountries()
            categories = await fetchCategories()
        }
    }
        
    public func fetchCountries() async -> [Country] {
        var countries = [Country]()
        countries.append(Country.allCountry)
        
        for code in Locale.isoRegionCodes {
            let id = Locale.identifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            if let name = NSLocale(localeIdentifier: "en_US").displayName(forKey: .identifier, value: id) {
                countries.append(Country(id: id, name: name, code: code))
            }
        }
        
        return countries
    }
    
    public func fetchCategories() async -> [NewsCategory] {
        NewsCategory.allCases
    }
}
