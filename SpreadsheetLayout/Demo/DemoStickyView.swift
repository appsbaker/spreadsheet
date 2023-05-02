//
//  DemoStickyView.swift
//  SpreadsheetLayout
//
//  Created by Slava Anishchuk on 28.04.2023.
//

import UIKit
import SnapKit


public class StickyValue {
    let title: String
    let subtitle: String
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
}

final class DemoStickyView: UICollectionViewCell, PresentableView {
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

    func configure(with value: Any) {
        if let value = value as? StickyValue {
            titleLabel.text = value.title
            subtitleLabel.text = value.subtitle
        }
    }
}
