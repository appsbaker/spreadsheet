//
//  SpreadsheetLayout.swift
//  SpreadsheetLayout
//
//  Created by Slava Anishchuk on 26.04.2023.
//

import UIKit

final class SpreadsheetLayout {
    var config: Configuration

    init(config: Configuration = .init()) {
        self.config = config
    }

    func makeLayout(for datasource: [[String]]) -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let self else { return nil }
            var groupWidth: CGFloat = 0
            var items: [NSCollectionLayoutItem] = []
            for (index, _) in datasource[sectionIndex].enumerated() {
                let width: CGFloat = self.config.columnWidths[safe: index] ?? Configuration.defaultColumnWidth
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(width),
                                                      heightDimension: .absolute(Configuration.defaultColumnHeight))
                items.append(
                    NSCollectionLayoutItem(layoutSize: itemSize)
                )
                groupWidth += width
            }

            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth),
                                                   heightDimension: .absolute(Configuration.defaultColumnHeight))
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitems: items
            )

            let section = NSCollectionLayoutSection(group: group)
            let sticky = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(widthDimension: .absolute(Configuration.defaultStickyColumnWidth),
                                  heightDimension: .absolute(Configuration.defaultColumnHeight)),
                elementKind: SupplementaryKind.sticky,
                alignment: .leading
            )

            sticky.pinToVisibleBounds = self.config.isStickableFirstColumn
            section.boundarySupplementaryItems.append(sticky)

            return section
        }
        return layout
    }
}
