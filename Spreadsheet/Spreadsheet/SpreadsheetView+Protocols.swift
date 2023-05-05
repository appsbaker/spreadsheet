//
//  Spreadsheet
//  SpreadsheetView+Protocols.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

protocol ValuePresenter {
    func present(value: String)
    func present(value: any Numeric)
}

protocol PresentableValue {
    func accept(presenter: ValuePresenter)
}

protocol PresentableView {
    func configure(with value: PresentableValue)
}
