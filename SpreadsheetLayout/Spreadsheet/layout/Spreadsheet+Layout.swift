//
//  Spreadsheet.swift
//  SpreadsheetLayout
//
//  Created by Slava Anishchuk on 26.04.2023.
//

import UIKit

extension SpreadsheetView {
    final class Layout {
        var config: Configuration
        
        init(config: Configuration = .init()) {
            self.config = config
        }

        func makeLayout(for values: [[Any]],
                        supplementaryKind: String) -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex: Int,
                                                                            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                guard let config = self?.config else {
                    fatalError("Could not create layout")
                }

                var groupWidth: CGFloat = 0
                var items: [NSCollectionLayoutItem] = []
                for (index, _) in values[sectionIndex].enumerated() {
                    let width: CGFloat = config.columnWidths[safe: index] ??
                    (index == 0 ? Configuration.defaultStickyColumnWidth : Configuration.defaultColumnWidth)

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
                let stickyWidth: CGFloat = config.columnWidths[safe: 0] ?? Configuration.defaultStickyColumnWidth

                let sticky = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: .init(widthDimension: .absolute(stickyWidth),
                                      heightDimension: .absolute(Configuration.defaultColumnHeight)),
                    elementKind: supplementaryKind,
                    alignment: .leading
                )
                sticky.pinToVisibleBounds = config.isStickableFirstColumn

                section.boundarySupplementaryItems.append(sticky)
                section.orthogonalScrollingBehavior = config.orthogonalScrollingBehavior
                section.contentInsets = config.contentInsets
                return section
            }
            return layout
        }
    }
}
