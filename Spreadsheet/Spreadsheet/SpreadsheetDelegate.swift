//
//  Spreadsheet
//  SpreadsheetDelegate.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit

protocol SpreadsheetDelegate: AnyObject {
    func spreadsheetDidScroll(_ scrollView: UIScrollView)
    func spreadsheet(didSelectValueItemAt indexPath: IndexPath, withValue: Any?)
    func spreadsheet(didSelectHeaderItemAtColumn index: Int, withValue: Any?)
}
