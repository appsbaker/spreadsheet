//
//  Spreadsheet
//  DemoHeaderCellView.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit
import SnapKit

final class DemoHeaderCellView: UICollectionViewCell, PresentableView {
    typealias T = String

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

    func configure(with value: Any) {
        textLabel.text = "\(value)"
    }
}
