//
//  NiblessTableViewCell.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import UIKit

public class NiblessTableViewCell: UITableViewCell {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
