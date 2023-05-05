//
//  Spreadsheet
//  SpreadsheetData.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

struct SpreadsheetData {
    private(set) var headers: [PresentableValue] = []
    private(set) var values: [[PresentableValue]] = []

    init(datatable: [[PresentableValue]]) {
        if !datatable.isEmpty {
            var datatable = datatable
            headers = datatable.removeFirst().map { $0 }
            values = datatable
        }
    }

    mutating func append(value: [PresentableValue]) {
        values.append(value)
    }

    mutating func removeAll() {
        values.removeAll()
    }
}
