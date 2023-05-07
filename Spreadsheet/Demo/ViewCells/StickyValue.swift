//
//  Spreadsheet
//  StickValue.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

protocol StickyValueVisitor {
    func visit(value: StickyValue)
}

struct StickyValue: PresentableValue {
    let title: String
    let subtitle: String

    func accept(visitor: ValueVisitor) {
        (visitor as? StickyValueVisitor)?.visit(value: self)
    }
}
