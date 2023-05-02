//
//  SpreadsheetData.swift
//  SpreadsheetLayout
//
//  Created by Slava Anishchuk on 28.04.2023.
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
}
