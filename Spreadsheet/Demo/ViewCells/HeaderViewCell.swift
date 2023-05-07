//
//  Spreadsheet
//  HeaderViewCell.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit
import SnapKit

final class HeaderViewCell: UICollectionViewCell, PresentableView {
    var textLabel = UILabel(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewAndConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupViewAndConstraints() {
        let stackView = UIStackView()
        contentView.addSubview(stackView)
        contentView.backgroundColor = .white

        stackView.axis = .horizontal
        stackView.addArrangedSubview(textLabel)
        stackView.snp.makeConstraints { $0.edges.equalToSuperview() }

        textLabel.font = .systemFont(ofSize: 12, weight: .bold)
        textLabel.textColor = .red
    }

    func configure(with value: PresentableValue) {
        value.accept(visitor: self)
    }
}

extension HeaderViewCell: ValueVisitor {
    func visit(value: any Numeric) {
        textLabel.text = "\(value)"
    }

    func visit(value: Bool) {
        textLabel.text = value ? "Yes" : "No"
    }

    func visit(value: String) {
        textLabel.font = .systemFont(ofSize: 12)
        textLabel.text = value
    }
}
