//
//  Array+.swift
//  SpreadsheetLayout
//
//  Created by Slava Anishchuk on 27.04.2023.
//

extension Array {
    subscript(safe index: Int) -> Element? {
        if index >= self.count { return nil }
        return self[index]
    }
}
