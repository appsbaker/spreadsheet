//
//  StickyView.swift
//  SpreadsheetStickyCellView
//
//  Created by Slava Anishchuk on 26.04.2023.
//

import UIKit
import SnapKit

final class SpreadsheetStickyCellView: UICollectionReusableView, PresentableView {
    var stackView = UIStackView(frame: .zero)
    var textLabel = UILabel(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewAndConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViewAndConstraints() {
        addSubview(stackView)
        backgroundColor = .white
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(4)
        }
        textLabel.font = .systemFont(ofSize: 15)
        stackView.addArrangedSubview(textLabel)
    }

    func configure(with value: Any) {
        textLabel.text = "\(value)"
    }
}
