//
//  Spreadsheet
//  ValueViewCell.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit
import SnapKit

final class ValueViewCell: UICollectionViewCell, PresentableView {
    var textLabel = UILabel(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with value: PresentableValue) {
        value.accept(visitor: self)
    }
}

extension ValueViewCell: ValueVisitor {
    func visit(value: any Numeric) {
        textLabel.text = "\(value)"
    }

    func visit(value: String) {
        textLabel.font = .systemFont(ofSize: 12)
        textLabel.text = value
    }

    func visit(value: Bool) {
        textLabel.text = value ? "Yes" : "No"
        textLabel.textColor = value ? .green : .red
    }
}
