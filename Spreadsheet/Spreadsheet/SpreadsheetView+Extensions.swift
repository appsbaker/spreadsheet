//
//  Spreadsheet
//  SpreadsheetView+Protocols.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

protocol PresentableView {
    func configure(with value: PresentableValue)
}

protocol PresentableValue {
    func accept(visitor: VisitorBase)
}

protocol VisitorBase {
    func visit(value: String)
    func visit(value: any Numeric)
}
