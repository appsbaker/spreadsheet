//
//  Spreadsheet
//  SpreadsheetView+Extensions.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

extension String: PresentableValue {
    func accept(presenter: ValuePresenter) {
        presenter.present(value: self)
    }
}

extension Int: PresentableValue {
    func accept(presenter: ValuePresenter) {
        presenter.present(value: self)
    }
}

extension Double: PresentableValue {
    func accept(presenter: ValuePresenter) {
        presenter.present(value: self)
    }
}
