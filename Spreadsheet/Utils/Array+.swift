//
//  Spreadsheet
//  Array+.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

extension Array {
    subscript(safe index: Int) -> Element? {
        if index >= self.count { return nil }
        return self[index]
    }
}
