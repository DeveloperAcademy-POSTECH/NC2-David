//
//  CGImage + UIImage Orientation Extension.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/08/29.
//

import Foundation
import UIKit
import ImageIO

extension CGImagePropertyOrientation {
    /// Converts an Image Orientation to a Core Graphics Image Property Orientation.
    /// Parameter Orientation: A "UIIMage.Orientation Instance
    ///
    /// The Two Orientation Types Use Different Raw Values.
    ///
    init(_ orientation: UIImage.Orientation) {
        switch orientation {
            case .up: self = .up
            case .down: self = .down
            case .left: self = .left
            case .right: self = .right
            case .upMirrored: self = .upMirrored
            case .downMirrored: self = .downMirrored
            case .leftMirrored: self = .leftMirrored
            case .rightMirrored: self = .rightMirrored
            @unknown default: self = .up
        }
    }
}
