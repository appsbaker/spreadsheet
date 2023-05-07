//
//  Spreadsheet
//  StoryboardVC.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit

final class StoryboardVC: UIViewController {
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var subtitleLabel: UILabel?
    @IBOutlet var spreadsheetView: SpreadsheetView?

    override func viewDidLoad() {
        super.viewDidLoad()
        spreadsheetView?.updateLayout(with: DataStorage.datatable)
    }

    @IBAction func clean() {
        spreadsheetView?.removeAllValues()
        spreadsheetView?.reloadValues()
    }

    @IBAction func addItems() {
        spreadsheetView?.appendValues(["Тинькоф", Int.random(in: 0...1000), Double.random(in: 0...100), "Россия", "Финансы"])
        spreadsheetView?.reloadValues()
    }
}
