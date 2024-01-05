//
//  UiNotificationFeedbackService.swift
//  Harry Potter App
//
//  Created by user240559 on 8/12/23.
//

import Foundation
import UIKit

protocol UiNotificationFeedbackService {
    
    func vibrate(vibrateType: UINotificationFeedbackGenerator.FeedbackType) 
    
    func impact(impactType: UIImpactFeedbackGenerator.FeedbackStyle)
}
