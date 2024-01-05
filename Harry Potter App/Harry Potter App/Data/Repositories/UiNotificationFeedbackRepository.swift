//
//  UiNotificationFeedbackRepository.swift
//  Harry Potter App
//
//  Created by user240559 on 8/12/23.
//

import Foundation
import UIKit

struct UiNotificationFeedbackRepository {
    
    private let feedbackNotificationService: UiNotificationFeedbackService
    
    init(feedbackNotificationService: UiNotificationFeedbackService) {
        self.feedbackNotificationService = feedbackNotificationService
    }
    
    func vibrate(vibrateType: UINotificationFeedbackGenerator.FeedbackType) {
        feedbackNotificationService.vibrate(vibrateType: vibrateType)
    }
    
    func impact(impactType: UIImpactFeedbackGenerator.FeedbackStyle) {
        feedbackNotificationService.impact(impactType: impactType)
    }
}
