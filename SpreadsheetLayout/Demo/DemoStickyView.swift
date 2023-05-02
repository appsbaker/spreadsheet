//
//  DemoStickyView.swift
//  SpreadsheetLayout
//
//  Created by Slava Anishchuk on 28.04.2023.
//

import UIKit
import SnapKit

/*
final class DemoStickyView: UICollectionViewCell, PresentableView {
    private var avatarView = UIView(frame: .zero)
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
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        subtitleLabel.font = .systemFont(ofSize: 12)

        contentStackView.axis =  .horizontal
        contentStackView.distribution = .fill
        contentStackView.addArrangedSubview(avatarView)
        contentStackView.addArrangedSubview(titlesStackView)

        titlesStackView.axis = .vertical
        titlesStackView.addArrangedSubview(titleLabel)
        titlesStackView.addArrangedSubview(subtitleLabel)

        contentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        avatarView.backgroundColor = .gray
        avatarView.snp.makeConstraints {
            $0.width.height.equalTo(16)
        }
    }

    func configure(with value: String) {}
}
*/
