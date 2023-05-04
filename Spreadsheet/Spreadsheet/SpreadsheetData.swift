//
//  Spreadsheet
//  SpreadsheetData.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

struct SpreadsheetData {
    private(set) var headers: [any PresentableValue] = []
    private(set) var values: [[any PresentableValue]] = []

    init(datatable: [[any PresentableValue]]) {
        if !datatable.isEmpty {
            var datatable = datatable
            headers = datatable.removeFirst().map { $0 }
            values = datatable
        }
    }

    mutating func append(value: [any PresentableValue]) {
        values.append(value)
    }

    mutating func removeAll() {
        values.removeAll()
    }
}
