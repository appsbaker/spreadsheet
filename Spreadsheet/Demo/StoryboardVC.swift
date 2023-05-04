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

    private var datatable: SpreadsheetData = .init(datatable: [[]])

    override func viewDidLoad() {
        super.viewDidLoad()
        spreadsheetView?.updateLayout(with: datatable)
    }

    @IBAction func clean() {
        spreadsheetView?.removeAllValues()
        spreadsheetView?.reloadValues()
    }
}
