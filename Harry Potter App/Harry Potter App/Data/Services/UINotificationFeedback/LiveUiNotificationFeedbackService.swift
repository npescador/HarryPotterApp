//
//  LiveUiNotificationFeedbackService.swift
//  Harry Potter App
//
//  Created by user240559 on 8/12/23.
//

import Foundation
import UIKit

class LiveUiNotificationFeedbackService: UiNotificationFeedbackService {
    
    func vibrate(vibrateType: UINotificationFeedbackGenerator.FeedbackType) {
        let feedbackGenerator = UINotificationFeedbackGenerator()
        feedbackGenerator.notificationOccurred(vibrateType)
    }
    
    func impact(impactType: UIImpactFeedbackGenerator.FeedbackStyle) {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: impactType)
        feedbackGenerator.impactOccurred()
    }
}
