//
//  Spreadsheet
//  SpreadsheetView.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

import UIKit
import SnapKit

final class SpreadsheetView: UIView {
    private(set) var data: SpreadsheetData = .init(datatable: [])
    private let layout = Layout()

    private(set) var headerCollectionView: UICollectionView!
    private(set) var valuesCollectionView: UICollectionView!
    private(set) var presentableValueView: UICollectionViewCell.Type?
    private(set) var presentableHeaderView: UICollectionViewCell.Type?
    private(set) var presentableStickyView: UICollectionViewCell.Type?

    var floatingButton: UIButton = UIButton(frame: .zero)

    weak var delegate: SpreadsheetDelegate?

    fileprivate func configureCollectionViews(_ data: SpreadsheetData) {
        headerCollectionView = makeCollectionView(layout.makeLayout(
            for: [data.headers],
            supplementaryKind: Layout.SupplementaryKind.headSticky)
        )

        valuesCollectionView = makeCollectionView(layout.makeLayout(
            for: data.values, supplementaryKind: Layout.SupplementaryKind.rowsSticky)
        )
    }

    fileprivate func setup() {
        setupActions()
        configureCollectionViews(data)
        setupViewAndConstraints()
    }

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

        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        floatingButton.layer.cornerRadius = floatingButton.frame.width / 2
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
        addSubview(floatingButton)

        headerCollectionView.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(Layout.Configuration.defaultColumnHeight)
        }

        valuesCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerCollectionView.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }

        floatingButton.isHidden = true
        floatingButton.backgroundColor = .black
        floatingButton.tintColor = .white
        floatingButton.setImage(.init(systemName: "chevron.up"), for: .normal)
        floatingButton.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.bottom.right.equalToSuperview().inset(24)
        }
    }

    private func setupActions() {
        floatingButton.addAction(
            UIAction { [weak self] _ in
                self?.valuesCollectionView.scrollToItem(at: .init(item: 0, section: 0), at: .top, animated: true)
            },
            for: .touchUpInside)
    }

    func updateLayout(with data: SpreadsheetData) {
        self.data = data
        headerCollectionView.collectionViewLayout = layout.makeLayout(for: [data.headers],
                                                 supplementaryKind: Layout.SupplementaryKind.headSticky)
        valuesCollectionView.collectionViewLayout = layout.makeLayout(for: data.values,
                                                 supplementaryKind: Layout.SupplementaryKind.rowsSticky)
    }

    func appendValues(values: [Any]) {
        data.append(value: values)
    }

    func removeAllValues() {
        data.removeAll()
    }

    func reloadValues() {
        valuesCollectionView.collectionViewLayout = layout.makeLayout(
            for: data.values,
            supplementaryKind: Layout.SupplementaryKind.rowsSticky
        )
    }
}
