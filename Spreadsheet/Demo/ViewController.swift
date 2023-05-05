//
//  Spreadsheet
//  ViewController.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//


import UIKit
import SnapKit

final class ViewController: UIViewController {
    private var datatable: SpreadsheetData = .init(datatable: [
        ["Акции", "Цена", "Изменение", "Страна бизнеса", "Сектор экономики"],
        ["Сбербанк", 239.29,  120.456, "Россия", "Финансы"],
        ["Тинькоф", 200, 32.10, "Россия", "Финансы"],
        ["Ozon", 1362.29, -12.30, "Россия", "IT"],
        ["ВТБ", 1.230229,  120.456, "Россия", "Финансы"],
        [StickyValue(title: "БКС", subtitle: "Мир.Инвестиций"), 200, 212, "Россия", "Финансы"],
    ])

    lazy var spreadsheetView: SpreadsheetView = .init(
        data: datatable,
        presentableValueView: ValueViewCell.self,
        presentableStickyView: StickyViewCell.self
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(spreadsheetView)
        spreadsheetView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}
