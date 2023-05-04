//
//  Spreadsheet
//  ViewController.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//


import UIKit
import SnapKit

struct User: PresentableValue {
    let name: String
    func accept(visitor: VisitorBase) {
        (visitor as? ClientVisitor)?.visit(value: self)
    }
}

final class ViewController: UIViewController {
    private var datatable: SpreadsheetData = .init(datatable: [
        ["Акции",    "Цена",  "Изменение", "Страна бизнеса", "Сектор экономики"],
        [StickyValue(title: "Сбербанк", subtitle: ""), 239.29,  120.456,     "Россия",         "Финансы"],
        ["Тинькоф",  User(name: "Slava"),  32.10,       "Россия",         "Финансы"],
        ["Ozon",     1362.29, -12.30,      "Россия",         "IT"],
        ["ВТБ", 1.230229,  120.456,     "Россия",         true],
    ])

    lazy var spreadsheetView: SpreadsheetView = .init(
        data: datatable,
        presentableValueView: DemoValueCellView.self
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
