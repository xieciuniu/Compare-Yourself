//
//  Item.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 10/11/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
