//
//  Spreadsheet
//  SpreadsheetHeaderViewCell.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit
import SnapKit

final class SpreadsheetHeaderViewCell: UICollectionViewCell, PresentableView {
    private var textLabel = UILabel(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewAndConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewAndConstraints() {
        contentView.addSubview(textLabel)
        contentView.backgroundColor = .white
        textLabel.font = .systemFont(ofSize: 12, weight: .bold)
        textLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func configure(with value: PresentableValue) {
        value.accept(visitor: self)
    }
}

extension SpreadsheetHeaderViewCell: ValueVisitor {
    func visit(value: Bool) {
        textLabel.text = value ? "Yes" : "No"
    }

    func visit(value: String) {
        textLabel.text = value
    }

    func visit(value: any Numeric) {
        textLabel.text = "\(value)"
    }
}
