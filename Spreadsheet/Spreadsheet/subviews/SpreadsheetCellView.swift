//
//  Spreadsheet
//  SpreadsheetCellView.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit
import SnapKit

final class SpreadsheetCellView: UICollectionViewCell, PresentableView {
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
        textLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func configure(with value: Any) {
        textLabel.text = "\(value)"
        contentView.backgroundColor = .white
    }
}
