//
//  Spreadsheet
//  SpreadsheetData.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

struct SpreadsheetData {
    private(set) var headers: [String] = []
    private(set) var values: [[Any]] = []

    init(datatable: [[Any]]) {
        if !datatable.isEmpty {
            var datatable = datatable
            self.headers = datatable.removeFirst().map { "\($0)" }
            self.values = datatable
        }
    }

    mutating func append(value: [Any]) {
        self.values.append(value)
    }
}
