//
//  ShareSheet.swift
//  ShareSheetDemo
//
//  Created by Jim Dovey on 10/7/19.
//  Copyright © 2019 Jim Dovey. All rights reserved.
//

import SwiftUI
import UIKit

struct ShareSheet: UIViewControllerRepresentable {
    typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
    
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let excludedActivityTypes: [UIActivity.ActivityType]? = nil
    let callback: Callback? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities)
        controller.excludedActivityTypes = excludedActivityTypes
        
        // I don't recall if Swift & ObjC block types are still incompatible by default...
        controller.completionWithItemsHandler = { type, completed, returnedItems, error in
            self.callback?(type, completed, returnedItems, error)
        }
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // nothing to do here
    }
}

struct ShareSheet_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheet(activityItems: ["A string" as NSString])
    }
}
