//
//  DemoValueCellView.swift
//  SpreadsheetLayout
//
//  Created by Slava Anishchuk on 28.04.2023.
//

import UIKit
import SnapKit

final class DemoValueCellView: UICollectionViewCell, PresentableView {
    typealias T = String

    var textLabel = UILabel(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(textLabel)
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure<T>(with value: T) {}

    func configure<T>(with value: T) where T == String {
        textLabel.text = value
        textLabel.font = .systemFont(ofSize: 13)
        if let val = Double(value) {
            textLabel.font = .systemFont(ofSize: 13, weight: .bold)
            textLabel.textColor = val >= 0 ? .blue : .red
        } else {
            textLabel.textColor = .black
        }
    }
}
