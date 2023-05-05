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
        value.accept(presenter: self)
    }
}

extension ValueViewCell: ValuePresenter {
    func present(value: any Numeric) {
        textLabel.text = "\(value)"
    }

    func present(value: String) {
        textLabel.font = .systemFont(ofSize: 12)
        textLabel.text = value
    }
}
