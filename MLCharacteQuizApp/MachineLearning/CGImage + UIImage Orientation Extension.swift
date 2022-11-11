//
//  CGImage + UIImage Orientation Extension.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/08/29.
//

import Foundation
import UIKit
import ImageIO

// ImageOrientaion Portrait LandScape등의  이미지회전을 대비함
extension CGImagePropertyOrientation {
    
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
