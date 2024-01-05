//
//  LiveDynamicIslandService.swift
//  Harry Potter App
//
//  Created by user240559 on 8/12/23.
//

import Foundation
import ActivityKit

class LiveDynamicIslandService: DynamicIslandService {
    
    func startActivity(name: String, house: String, image: String) throws -> String {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            return ""
        }
        
        let initialState = DynamicIslandAttributes.ContentState(name: name, house: house, image: image)
        
        let futureDate: Date = .now + 3600
        let activityContent = ActivityContent(state: initialState, staleDate: futureDate)
        
        let dynamicIslandAttributes = DynamicIslandAttributes()
        do {
            let activity = try Activity.request(attributes: dynamicIslandAttributes,
                                                content: activityContent,
                                                pushType: nil)
            return activity.id
        } catch {
            throw error
        }
    }
    
    func updateActivity(activityIdentifier: String, name: String, house: String, image: String) async {
        let updatedContentState = DynamicIslandAttributes.ContentState(name: name, house: house, image: image)
        
        let activity = Activity<DynamicIslandAttributes>.activities.first(where: { $0.id == activityIdentifier })
        
        let activityContent = ActivityContent(state: updatedContentState, staleDate: .now + 3600)
        
        await activity?.update(activityContent)
    }
    
    func endActivity() async {
        //let value = Activity<DynamicIslandAttributes>.activities.first(where: { $0.id == activityIdentifier })
        let value = Activity<DynamicIslandAttributes>.activities.first
        await value?.end(nil)
    }
}
