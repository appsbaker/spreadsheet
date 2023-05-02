//
//  SpreadsheetLayout+Configuration.swift
//  SpreadsheetLayout
//
//  Created by Slava Anishchuk on 27.04.2023.
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
