//
//  CellView.swift
//  SpreadsheetCellView
//
//  Created by Slava Anishchuk on 26.04.2023.
//

import UIKit
import SnapKit

final class SpreadsheetCellView: UICollectionViewCell, PresentableView {
    static let reusableIdentifier: String = "spreadsheetCellViewID"
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

    func configure(with value: Any) {
        textLabel.text = "\(value)"
        contentView.backgroundColor = .white
    }
}
