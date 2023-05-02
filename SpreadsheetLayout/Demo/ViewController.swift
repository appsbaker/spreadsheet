//
//  ViewController.swift
//  SpreadsheetLayout
//
//  Created by Slava Anishchuk on 26.04.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    private var titleLabel = UILabel(frame: .zero)
    private var actionButton = UIButton(configuration: .filled())

    private let datatable: SpreadsheetData = .init(datatable: [
        ["Акции",    "Цена",  "Изменение", "Страна бизнеса", "Сектор экономики"],
        ["Сбербанк", 239.29,  120.456,     "Россия",         "Финансы"],
        ["Тинькоф",  362.29,  32.10,       "Россия",         "Финансы"],
        ["Ozon",     1362.29, -12.30,      "Россия",         "IT"],
    ])

    private lazy var spreadsheetView = SpreadsheetView(
        data: datatable,
        layoutConfiguration: .init(
            contentInsets: .init(top: 0, leading: 0, bottom: 8, trailing: 8)
        )
    )

    func setupViewAndConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(spreadsheetView)
        view.addSubview(actionButton)

        titleLabel.text = "Spreadsheet"
        titleLabel.font = .systemFont(ofSize: 24)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(96)
            $0.leading.trailing.equalToSuperview().inset(8)
        }

        spreadsheetView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(actionButton.snp.top).inset(16)
        }

        actionButton.setTitle("Add Values", for: .normal)
        actionButton.snp.makeConstraints {
            $0.height.equalTo(54)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(32)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewAndConstraints()
    }
}
