//
//  Spreadsheet
//  SpreadsheetView+UICollectionViewDelegate.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit

extension SpreadsheetView: UICollectionViewDelegate {
    fileprivate func handleDidSelectValueItem(_ collectionView: UICollectionView,
                                              _ indexPath: IndexPath) {
        guard collectionView == valuesCollectionView else { return }
        let value = data.values[indexPath.section][indexPath.row]
        delegate?.spreadsheet(didSelectValueItemAt: indexPath,
                              withValue: value)
    }

    fileprivate func handelDidSelectHeaderItem(_ collectionView: UICollectionView,
                                               _ indexPath: IndexPath) {
        guard collectionView == headerCollectionView else { return }
        let value = data.headers[indexPath.row]
        delegate?.spreadsheet(didSelectHeaderItemAtColumn: indexPath.row,
                              withValue: value)
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        handleDidSelectValueItem(collectionView, indexPath)
        handelDidSelectHeaderItem(collectionView, indexPath)
    }
}
