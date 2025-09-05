//
//  UIApplication+extensions.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import Foundation
import UIKit

extension UIApplication {
    var windows: [UIWindow] {
        return UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
    }
}
