//
//  FancyToastStyle.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 28/02/23.
//

import SwiftUI

enum FancyToastStyle {
    case error
    case success
}

extension FancyToastStyle {
    var themeColor: Color {
        switch self {
        case .error: return Color.red
        case .success: return Color.blue
        }
    }
}

struct FancyToast: Equatable {
    var type: FancyToastStyle
    var message: String
    var duration: Double = 3
}
