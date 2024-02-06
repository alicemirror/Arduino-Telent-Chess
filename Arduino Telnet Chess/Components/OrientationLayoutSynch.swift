//
//  OrientationLayoutSynch.swift
//  Arduino Telnet Chess
//
//  Created by Enrico Miglino on 1/2/24.
//  Copyright © 2024 Enrico Miglino. All rights reserved.
//

import SwiftUI

enum LayoutState {
    case vertical
    case horizontal
}

struct ConditionalLayout: ViewModifier {
    let content: Content
    let layoutState: LayoutState
    
    init(_ layoutState: LayoutState, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.layoutState = layoutState
    }
    
    @ViewBuilder
    func body(content: Content) -> some View {
        content
            .opacity((layoutState == .vertical && UIDevice.current.orientation.isPortrait) || (layoutState == .horizontal && UIDevice.current.orientation.isLandscape) ? 1 : 0)
    }
}

extension View {
    func conditionalLayout(_ layoutState: LayoutState) -> some View {
        self.modifier(ConditionalLayout(layoutState) {
            self as! ConditionalLayout.Content
        })
    }
}

struct OrientationLayoutSync<Content: View>: View {
    @State private var currentLayout: LayoutState = .vertical
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
                .conditionalLayout(currentLayout)
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                currentLayout = UIDevice.current.orientation.isPortrait ? .vertical : .horizontal
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(UIDevice.orientationDidChangeNotification)
        }
    }
}

struct ContentView: View {
    var body: some View {
        OrientationLayoutSync {
            PlayView()
        }
    }
}
