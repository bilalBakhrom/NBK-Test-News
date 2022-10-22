//
//  DetailsContentView.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 21/10/2022.
//

import SwiftUI
import NewsNetwork

public struct DetailsContentView: View {
    @Binding public var article: Article
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(article.title ?? "")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color.theme.primaryLabel)
            
            Text(article.description ?? "")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(Color.theme.primaryLabel)
                .lineSpacing(2)
            
            Text(article.content ?? "No content")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(Color.theme.primaryLabel)
                .lineSpacing(2)
            
            HStack(spacing: 0) {
                Spacer(minLength: 0)
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text(article.author ?? "")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color.theme.primaryLabel)
                    
                    Text(article.readableDate)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color.theme.primaryLabel.opacity(0.8))
                }
            }
        }
        .padding(.horizontal)
        .padding(.top)
        .padding(.bottom, 40)
        .frame(maxWidth: UIScreen.main.bounds.width)
    }
}
