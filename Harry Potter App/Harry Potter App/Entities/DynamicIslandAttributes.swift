//
//  DynamicIslandAttributes.swift
//  Harry Potter App
//
//  Created by user240559 on 8/12/23.
//

import Foundation
import ActivityKit

struct DynamicIslandAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var name: String
        var house: String
        var image: String
    }
}
