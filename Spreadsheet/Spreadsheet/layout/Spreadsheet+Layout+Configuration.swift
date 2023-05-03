//
//  Spreadsheet
//  Spreadsheet+Configuration.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit

extension SpreadsheetView.Layout {
    struct Configuration {
        /// Ширина колонки по умолчанию
        static let defaultStickyColumnWidth: CGFloat = 144
        /// Ширина колонки по умолчанию
        static let defaultColumnWidth: CGFloat = 100
        /// Высота строки по умолчанию
        static let defaultColumnHeight: CGFloat = 44

        var columnWidths: [CGFloat] = []
        var isStickableFirstColumn: Bool = true
        var orthogonalScrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior = .none
        var contentInsets: NSDirectionalEdgeInsets = .zero
    }
}
