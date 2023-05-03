//
//  Spreadsheet
//  SpreadsheetHeaderCellView.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit
import SnapKit

final class SpreadsheetHeaderCellView: UICollectionViewCell, PresentableView {
    static let reusableIdentifier: String = "spreadsheetHeaderCellView"

    func setContent(view: UIView) {
        contentView.addSubview(view)
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func configure(with value: Any) {
        let textLabel = UILabel(frame: .zero)
        textLabel.text = "\(value)"
        contentView.addSubview(textLabel)
        contentView.backgroundColor = .white
        textLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        textLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
