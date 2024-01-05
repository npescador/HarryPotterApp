//
//  DynamicIslandService.swift
//  Harry Potter App
//
//  Created by user240559 on 8/12/23.
//

import Foundation

protocol DynamicIslandService {
    func startActivity(name: String, house: String, image: String) throws -> String
    func updateActivity(activityIdentifier: String, name: String, house: String, image: String) async
    func endActivity() async
}
