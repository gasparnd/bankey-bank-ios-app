//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Gaspar Dolcemascolo on 10/11/2024.
//

import Foundation
import UIKit

class AccountSummaryCell: UITableViewCell {
    
    let typeLabel = UILabel()
    let dividerView = UIView()
    
    let descriptionLabel = UILabel()
    
    let balanceStackView = UIStackView()
    let currentBalanceLabel = UILabel()
    let amountLabel = UILabel()
    
    let chevronImageView = UIImageView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 100
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell {
    private func setup() {
        // TYPE LABEL
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account type"
        
        //  DIVIDER
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = appColor
        
        // AMOUNT STACK VIEW
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        // DESCRIPTION LABEL
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.text = "Account name"
        
        // CURRENT BALANCE LABEL
        currentBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        currentBalanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        currentBalanceLabel.textAlignment = .right
        currentBalanceLabel.text = "Some balance"
        
        // AMOUNT LABEL
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.textAlignment = .right
        amountLabel.text = "$17,562"
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        let chevronImage = UIImage(systemName: "chevron.right")!.withTintColor(appColor, renderingMode: .alwaysOriginal)
        chevronImageView.image = chevronImage
        
        contentView.addSubview(typeLabel) // important! add contentView
        contentView.addSubview(dividerView)
        contentView.addSubview(descriptionLabel)
        
        balanceStackView.addArrangedSubview(currentBalanceLabel)
        balanceStackView.addArrangedSubview(amountLabel)
        contentView.addSubview(balanceStackView)
        contentView.addSubview(chevronImageView)
        
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            dividerView.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 3),
            dividerView.widthAnchor.constraint(equalToConstant: 60),
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 2),
            descriptionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            balanceStackView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 0),
            balanceStackView.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 4),
            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1)
        ])
    }
}
