//
//  MyExtensionLiveActivity.swift
//  MyExtension
//
//  Created by user240559 on 8/12/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

@main
struct MyExtensionLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DynamicIslandAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text(context.state.name)
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    if context.state.image == "person.fill" {
                        Image(systemName: context.state.image)
                    } else {
                        AsyncImage(url: URL(string: context.state.image))
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60,height: 60)
                            .clipShape(Circle())
                    }
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("")
                }
                DynamicIslandExpandedRegion(.center) {
                    Text("\(context.state.house) - \(context.state.name)")
                    // more content
                }
            } compactLeading: {
                Text(context.state.name)
            } compactTrailing: {
                Text(context.state.house)
            } minimal: {
                Text(context.state.name)
            }
            .keylineTint(Color.red)
        }
    }
}

//#Preview("Notification", as: .content, using: MyExtensionAttributes.preview) {
//   MyExtensionLiveActivity()
//} contentStates: {
//    MyExtensionAttributes.ContentState.smiley
//    MyExtensionAttributes.ContentState.starEyes
//}
