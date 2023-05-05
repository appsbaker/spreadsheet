//
//  Spreadsheet
//  StickValue.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

struct StickyValue: PresentableValue {
    let title: String
    let subtitle: String

    func accept(presenter: ValuePresenter) {
        (presenter as? StickyValuePresenter)?.present(value: self)
    }
}

protocol StickyValuePresenter {
    func present(value: StickyValue)
}
