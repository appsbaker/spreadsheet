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
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var subtitleLabel: UILabel?
    @IBOutlet var spreadsheetView: SpreadsheetView?

    private var datatable: SpreadsheetData = .init(datatable: [
        ["Акции",    "Цена",  "Изменение", "Страна бизнеса", "Сектор экономики"],
        ["Сбербанк", 239.29,  120.456,     "Россия",         "Финансы"],
        ["Тинькоф",  362.29,  32.10,       "Россия",         "Финансы"],
        ["Ozon",     1362.29, -12.30,      "Россия",         "IT"],
    ])

    override func viewDidLoad() {
        super.viewDidLoad()
        spreadsheetView?.delegate = self
        spreadsheetView?.updateLayout(with: datatable)
    }

    @IBAction func addItems() {
        for _ in 1...50 {
            spreadsheetView?.appendValues(values: ["Сбербанк", Int.random(in: 1...100),  Int.random(in: 30...90), "Россия", "Финансы"])
        }
        spreadsheetView?.reloadValues()
        subtitleLabel?.text = "Items count: \(spreadsheetView?.data.values.count ?? 0)"
    }

    @IBAction func clean() {
        spreadsheetView?.removeAllValues()
        spreadsheetView?.reloadValues()
    }
}


extension ViewController: SpreadsheetDelegate {
    func spreadsheetDidScroll(_ scrollView: UIScrollView) {
        subtitleLabel?.text  = "scrollView.contentOffset: \(scrollView.contentOffset)"
    }

    func spreadsheet(didSelectValueItemAt indexPath: IndexPath, withValue: Any?) {
        subtitleLabel?.text  = "Selected cell: at: \(indexPath) with: \(withValue)"
    }

    func spreadsheet(didSelectHeaderItemAtColumn index: Int, withValue: Any?) {
        subtitleLabel?.text  = "Selected header: at: \(index) with: \(withValue)"
    }
}
