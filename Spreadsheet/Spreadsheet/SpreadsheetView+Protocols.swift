//
//  Spreadsheet
//  SpreadsheetView+Protocols.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

protocol ValueVisitor {
    func visit(value: Bool)
    func visit(value: String)
    func visit(value: any Numeric)
}

protocol PresentableValue {
    func accept(visitor: ValueVisitor)
}

protocol PresentableView {
    func configure(with value: PresentableValue)
}
