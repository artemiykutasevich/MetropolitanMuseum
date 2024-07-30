//
//  Date + Extensions.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 31.07.24.
//

import Foundation

extension Date {
    func getFormattedDate(format: String) -> String {
         let dateformat = DateFormatter()
         dateformat.dateFormat = format
         return dateformat.string(from: self)
     }
}
