//
//  SpreadsheetView.swift
//  SpreadsheetLayout
//
//  Created by Slava Anishchuk on 27.04.2023.
//

import UIKit
import SnapKit

final class SpreadsheetView: UIView {
    private(set) var data: SpreadsheetData = .init(datatable: [])
    private let layout = Layout()

    var headerCollectionView: UICollectionView!
    var valuesCollectionView: UICollectionView!

    var presentableValueView: UICollectionViewCell.Type?
    var presentableHeaderView: UICollectionViewCell.Type?
    var presentableStickyView: UICollectionViewCell.Type?

    weak var delegate: SpreadsheetDelegate?

    init(data: SpreadsheetData,
         layoutConfiguration: Layout.Configuration = .init(),
         presentableValueView: UICollectionViewCell.Type? = nil,
         presentableHeaderView: UICollectionViewCell.Type? = nil,
         presentableStickyView: UICollectionViewCell.Type? = nil) {
        super.init(frame: .zero)
        self.data = data
        self.layout.config = layoutConfiguration
        self.presentableValueView = presentableValueView
        self.presentableHeaderView = presentableHeaderView
        self.presentableStickyView = presentableStickyView

        headerCollectionView = makeCollectionView(layout.makeLayout(
            for: [data.headers],
            supplementaryKind: Layout.SupplementaryKind.headSticky)
        )

        valuesCollectionView = makeCollectionView(layout.makeLayout(
            for: data.values, supplementaryKind: Layout.SupplementaryKind.rowsSticky)
        )
        
        setupViewAndConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func makeCollectionView(_ layout: UICollectionViewLayout) -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.bounces = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false

        // MARK: - HeaderCells
        if let presentableHeaderView {
            collectionView.register(presentableHeaderView,
                                    forCellWithReuseIdentifier: String(describing: presentableHeaderView.self))
        } else {
            collectionView.register(SpreadsheetHeaderCellView.self,
                                    forCellWithReuseIdentifier: SpreadsheetHeaderCellView.reusableIdentifier)
        }

        // MARK: - ValueCells
        if let presentableValueView {
            collectionView.register(presentableValueView,
                                    forCellWithReuseIdentifier: String(describing: presentableValueView))
        } else {
            collectionView.register(SpreadsheetCellView.self,
                                    forCellWithReuseIdentifier: SpreadsheetCellView.reusableIdentifier)
        }

        // MARK: - SupplementaryView
        var headStickyId = Layout.SupplementaryKind.headSticky
        if let presentableStickyView { headStickyId = String(describing: presentableStickyView.self) }
        collectionView.register(SpreadsheetHeaderCellView.self,
                                forSupplementaryViewOfKind: Layout.SupplementaryKind.headSticky,
                                withReuseIdentifier: headStickyId)

        if let presentableStickyView {
            collectionView.register(presentableStickyView,
                                    forSupplementaryViewOfKind: Layout.SupplementaryKind.rowsSticky,
                                    withReuseIdentifier: String(describing: presentableStickyView.self))
        } else {
            collectionView.register(SpreadsheetStickyCellView.self,
                                    forSupplementaryViewOfKind: Layout.SupplementaryKind.rowsSticky,
                                    withReuseIdentifier: Layout.SupplementaryKind.rowsSticky)
        }
        return collectionView
    }

    private func setupViewAndConstraints() {
        addSubview(headerCollectionView)
        addSubview(valuesCollectionView)

        headerCollectionView.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(Layout.Configuration.defaultColumnHeight)
        }

        valuesCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerCollectionView.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}
