//
//  Spreadsheet
//  SpreadsheetStickyCellView.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit
import SnapKit

final class SpreadsheetStickyCellView: UICollectionReusableView, PresentableView {
    private var stackView = UIStackView(frame: .zero)
    private var textLabel = UILabel(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewAndConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewAndConstraints() {
        addSubview(stackView)
        backgroundColor = .white
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(4)
        }
        textLabel.font = .systemFont(ofSize: 15)
        stackView.addArrangedSubview(textLabel)
    }

    func configure(with value: any PresentableValue) {
        value.accept(visitor: self)
    }
}


extension SpreadsheetStickyCellView: VisitorBase {
    func visit(value: String) {
        textLabel.text = value
    }
    func visit(value: StickyValue) {
        textLabel.text = value.presentableValue.title
    }
    func visit(value: any Numeric) {
        textLabel.text = "\(value)"
    }
}

