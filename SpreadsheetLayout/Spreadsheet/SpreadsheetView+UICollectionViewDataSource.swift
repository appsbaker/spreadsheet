//
//  SpreadsheetView+UICollectionView.swift
//  SpreadsheetLayout
//
//  Created by Slava Anishchuk on 26.04.2023.
//

import UIKit

extension SpreadsheetView: UICollectionViewDataSource {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == headerCollectionView {
            valuesCollectionView.contentOffset.x = scrollView.contentOffset.x
        } else if scrollView == valuesCollectionView {
            headerCollectionView.contentOffset.x = scrollView.contentOffset.x
        }
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

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == headerCollectionView {
            return getHeaderCellView(for: indexPath)
        }
        return getValueCellView(for: indexPath)
    }

    private func getValueCellView(for indexPath: IndexPath) -> UICollectionViewCell {
        if let presentableValueView {
            let cell = valuesCollectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: presentableValueView), for: indexPath)
            (cell as? any PresentableView)?.configure(with: data.values[indexPath.section][indexPath.row])
            return cell
        } else {
            let cell = valuesCollectionView.dequeueReusableCell(
                withReuseIdentifier: SpreadsheetCellView.reusableIdentifier, for: indexPath)
            if indexPath.row > 0 {
                (cell as? any PresentableView)?.configure(with: data.values[indexPath.section][indexPath.row])
            }
            return cell
        }
    }

    private func getHeaderCellView(for indexPath: IndexPath) -> UICollectionViewCell {
        if let presentableHeaderView {
            let cell = valuesCollectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: presentableHeaderView.self), for: indexPath)
            if indexPath.row > 0 {
                (cell as? any PresentableView)?.configure(with: data.headers[indexPath.row])
            }
            return cell
        } else {
            let cell = valuesCollectionView.dequeueReusableCell(
                withReuseIdentifier: SpreadsheetHeaderCellView.reusableIdentifier, for: indexPath)
            if indexPath.row > 0 {
                (cell as? any PresentableView)?.configure(with: data.headers[indexPath.row])
            }
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case Layout.SupplementaryKind.headSticky:
            var identifier = Layout.SupplementaryKind.headSticky
            if let presentableStickyView { identifier = String(describing: presentableStickyView.self) }

            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: Layout.SupplementaryKind.headSticky,
                withReuseIdentifier: identifier,
                for: indexPath)
            (view as? any PresentableView)?.configure(with: "\(data.headers[indexPath.row])")
            return view

        case Layout.SupplementaryKind.rowsSticky:
            var identifier = Layout.SupplementaryKind.rowsSticky
            if let presentableStickyView { identifier = String(describing: presentableStickyView.self) }

            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: Layout.SupplementaryKind.rowsSticky,
                withReuseIdentifier: identifier,
                for: indexPath)
            (view as? any PresentableView)?.configure(with: data.values[indexPath.section][0])
            return view

        default:
            return UICollectionReusableView()
        }
    }
}

