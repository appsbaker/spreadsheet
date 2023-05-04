//
//  Spreadsheet
//  SpreadsheetView+UICollectionView.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit

extension SpreadsheetView: UICollectionViewDataSource {
    fileprivate func handleFlowButtonVisible(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 300 {
            if floatingButton.isHidden {
                floatingButton.isHidden = false
                floatingButton.isEnabled = true
            }
        } else {
            if !floatingButton.isHidden {
                floatingButton.isHidden = true
                floatingButton.isEnabled = false
            }
        }
    }

    fileprivate func synchronizeHorizontalScrolls(_ scrollView: UIScrollView) {
        if scrollView == headerCollectionView {
            valuesCollectionView.contentOffset.x = scrollView.contentOffset.x
        } else if scrollView == valuesCollectionView {
            headerCollectionView.contentOffset.x = scrollView.contentOffset.x

        }
    }

    fileprivate func getHeaderCellView(for indexPath: IndexPath) -> UICollectionViewCell {
        let headerCellType: UICollectionViewCell.Type = presentableHeaderView ?? SpreadsheetHeaderCellView.self
        let cell = headerCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: headerCellType),
                                                            for: indexPath)
        guard indexPath.row > 0 else { return cell }
        (cell as? any PresentableView)?.configure(with: data.headers[indexPath.row])
        return cell
    }

    fileprivate func getValueCellView(for indexPath: IndexPath) -> UICollectionViewCell {
        let valueCellType: UICollectionViewCell.Type = presentableValueView ?? SpreadsheetCellView.self
        let cell = valuesCollectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: valueCellType),
            for: indexPath
        )
        (cell as? any PresentableView)?.configure(with: data.values[indexPath.section][indexPath.row])
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        synchronizeHorizontalScrolls(scrollView)

        guard scrollView == valuesCollectionView else { return }
        delegate?.spreadsheetDidScroll(scrollView)
        handleFlowButtonVisible(scrollView)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == headerCollectionView { return 1 }
        if collectionView == valuesCollectionView { return data.values.count }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return data.headers.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == headerCollectionView {
            return getHeaderCellView(for: indexPath)
        }
        return getValueCellView(for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case Layout.SupplementaryKind.headSticky:
            let cellViewType: UICollectionReusableView.Type = presentableHeaderView ?? SpreadsheetHeaderCellView.self
            let cellView = collectionView.dequeueReusableSupplementaryView(
                ofKind: Layout.SupplementaryKind.headSticky,
                withReuseIdentifier: Layout.SupplementaryKind.headSticky,
                for: indexPath)
            (cellView as? any PresentableView)?.configure(with: "\(data.headers[safe: 0] ?? "")")
            return cellView

        case Layout.SupplementaryKind.rowsSticky:
            let cellViewType: UICollectionReusableView.Type = presentableStickyView ?? SpreadsheetStickyCellView.self
            let cellView = collectionView.dequeueReusableSupplementaryView(
                ofKind: Layout.SupplementaryKind.rowsSticky,
                withReuseIdentifier: Layout.SupplementaryKind.rowsSticky,
                for: indexPath)
            (cellView as? any PresentableView)?.configure(with: data.values[indexPath.section][safe: 0] ?? "")
            return cellView

        default: return .init(frame: .zero)
        }
    }
}
