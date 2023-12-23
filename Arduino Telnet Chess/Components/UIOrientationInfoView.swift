//
//  UIOrientationInfoView.swift
//  Arduino Telnet Chess
//
//  Created by Enrico Miglino on 23/12/23.
//  Copyright © 2023 Enrico Miglino. All rights reserved.
//

import SwiftUI
import UIKit

// The view controller that receives the two view layouts
// to make reusable the logic of different layouts according
// to the device orientations.
struct CustomUIKitView: UIViewControllerRepresentable {
    let portraitLayout: AnyView
    let landscapeLayout: AnyView

    // Create a UI View Controller in the context. It is an instance
    // of the classe OrientationCustomViewController
    func makeUIViewController(context: Context) -> UIViewController {
        return OrientationCustomViewController(portrait: UIHostingController(rootView: portraitLayout),
                                               landscape: UIHostingController(rootView: landscapeLayout))
    } // Make the UIViewController

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Cast the UIViewController to the custom view controller.
        // If the orientation of the device has been changed, the layuout should
        // be updated accordingly.
        if let viewController = uiViewController as? OrientationCustomViewController {
            viewController.updateLayout()
        } // If orientation has changed
    } // updateUIViewController on orientation changed

    // Class OrientationCustomViewController contains the methods
    // to show the landscape or portrait controller.
    class OrientationCustomViewController: UIViewController {
        private var portraitController: UIHostingController<AnyView>
        private var landscapeController: UIHostingController<AnyView>

        // Initialization function. The two layout views are assigned to
        // the corresponding controller for portrait and landscape.
        init(portrait: UIHostingController<AnyView>, landscape: UIHostingController<AnyView>) {
            self.portraitController = portrait
            self.landscapeController = landscape
            super.init(nibName: nil, bundle: nil)
        } // init

        // Check for correct initialization. Return and error is
        // both UIControllers are not associated to a layout.
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        } // Error on initialization

        // Load both layout views.
        override func viewDidLoad() {
            super.viewDidLoad()
            // Add both as child view controllers, 
            // but only display one based on orientation
            addChild(portraitController)
            addChild(landscapeController)
            view.addSubview(portraitController.view)
            view.addSubview(landscapeController.view)
            portraitController.didMove(toParent: self)
            landscapeController.didMove(toParent: self)
        } // viewDidLoad()

        // Override the viewWillLayoutSubviews() and
        // recall the layout visualization updated.
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            updateLayout()
        } // viewWillLayoutSubviews()

        // Updates the layout according to the current orientation.
        // Note that both layous are always active, but only the one
        // corresponding to the current orientation is visible.
        func updateLayout() {
            // Orientation is landscape: make visible  the
            // landscape view.
            if UIDevice.current.orientation.isLandscape {
                portraitController.view.isHidden = true
                landscapeController.view.isHidden = false
                landscapeController.view.frame = view.bounds
            } // landscape orientation
            // Orientation is portrait, make the portrait layout
            // visible.
            else {
                portraitController.view.isHidden = false
                landscapeController.view.isHidden = true
                portraitController.view.frame = view.bounds
            } // protrait orientation
        } // updateLayout()
    } // Class OrientationCustomViewController
} // Custom UIKit view
