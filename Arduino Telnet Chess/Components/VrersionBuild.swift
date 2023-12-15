//
//  TitlesView.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 30/11/23.
//

import SwiftUI

// Generic page view title
struct VersionBuild: View {
    // --------------------- Variables
    // Retrieve the version and buld numbernumber.
    var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        } // Version is string
        return "Version ???"
    } // appVersion
    
    // Retrieve the version and buld numbernumber.
    var appBuildNumber: String {
        if let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return buildNumber
        } // Subversion is string
        return ".---"
    } // appBuildNumber
    // --------------------- Variables End

    var body: some View {
        // Application version and build number
        GeometryReader {
            geometry in
            Text("Version \(appVersion).\(appBuildNumber)")
                .position(x: geometry.size.width / 2, y: geometry.size.height / 1.1)
                .font(.custom("San Francisco (SF Pro Text)", size: 32))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .lineSpacing(10)
                .truncationMode(.tail)
                .kerning(1.5)
                .opacity(1)
        } // Version geometry
    }
}
