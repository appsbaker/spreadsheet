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
    lazy var spreadsheetView: SpreadsheetView = .init(
        data: DataStorage.datatable,
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
