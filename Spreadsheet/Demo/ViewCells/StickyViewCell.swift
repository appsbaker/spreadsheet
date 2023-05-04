//
//  Spreadsheet
//  StickyView.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit
import SnapKit

final class StickyViewCell: UICollectionViewCell, PresentableView {
    private var titleLabel = UILabel(frame: .zero)
    private var subtitleLabel = UILabel(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewAndConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewAndConstraints() {
        let contentStackView = UIStackView(frame: .zero)
        let titlesStackView = UIStackView(frame: .zero)

        contentView.backgroundColor = .white

        contentView.addSubview(contentStackView)
        titleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.font = .systemFont(ofSize: 10, weight: .bold)

        subtitleLabel.textColor = .white
        subtitleLabel.backgroundColor = .darkGray

        contentStackView.axis =  .horizontal
        contentStackView.distribution = .equalSpacing
        contentStackView.addArrangedSubview(titlesStackView)

        titlesStackView.axis = .vertical
        titlesStackView.addArrangedSubview(titleLabel)
        titlesStackView.addArrangedSubview(subtitleLabel)

        contentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func configure(with value: PresentableValue) {
        value.accept(presenter: self)
    }
}


extension StickyViewCell: ValuePresenter {
    func present(value: any Numeric) {
        debugPrint("\(value)")
        titleLabel.text = "\(value)"
    }

    func present(value: String) {
        titleLabel.font = .systemFont(ofSize: 12)
        titleLabel.text = value
    }
}
