//
//  CellNumber.swift
//  TableViewTest
//
//  Created by JINHONG AN on 2021/08/12.
//

import Foundation

enum CellNumber: Int {
    case zeroth
    case first
    case second
    case other
    
    var imageURL: String? {
        switch self {
        case .zeroth:
            return "https://wallpaperaccess.com/download/europe-4k-1369012"
        case .first:
            return "https://wallpaperaccess.com/download/europe-4k-1318341"
        case .second:
            return "https://wallpaperaccess.com/download/europe-4k-1379801"
        case .other:
            return nil
        }
    }
}
