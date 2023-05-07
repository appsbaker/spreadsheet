//
//  Spreadsheet
//  SpreadsheetView+Extensions.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

extension String: PresentableValue {
    func accept(visitor: ValueVisitor) {
        visitor.visit(value: self)
    }
}

extension Int: PresentableValue {
    func accept(visitor: ValueVisitor) {
        visitor.visit(value: self)
    }
}

extension Double: PresentableValue {
    func accept(visitor: ValueVisitor) {
        visitor.visit(value: self)
    }
}

extension Bool: PresentableValue {
    func accept(visitor: ValueVisitor) {
        visitor.visit(value: self)
    }
}
