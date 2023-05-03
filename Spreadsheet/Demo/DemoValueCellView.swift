//
//  Spreadsheet
//  DemoValueCellView.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit
import SnapKit

final class DemoValueCellView: UICollectionViewCell, PresentableView {
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

    func configure(with value: Any) {
        textLabel.text = "\(value)"
        textLabel.font = .systemFont(ofSize: 13)
    }
}
