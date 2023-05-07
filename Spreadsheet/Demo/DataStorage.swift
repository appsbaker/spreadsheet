//
//  Spreadsheet
//  DataStorage.swift
//
//  Created by Slava Anishchuk
//  Copyright © 2023 Slava Anishchuk. All rights reserved.
//

final class DataStorage {
    private init() {}
    static let datatable: SpreadsheetData = .init(datatable: [
        ["Акции", "Цена", "Изменение", "Страна бизнеса", "Сектор экономики"],
        ["Сбербанк", 239.29,  120.456, "Россия", "Финансы"],
        ["Тинькоф", 200, 32.10, "Россия", "Финансы"],
        ["Ozon", 1362.29, -12.30, true, "IT"],
        ["ВТБ", false,  120.456, "Россия", "Финансы"],
        [0, true, 212, "Россия", "Финансы"],
    ])
}
