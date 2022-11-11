//
//  ClassificationTest.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/11/12.
//

import Foundation
import UIKit
import ImageIO
import CoreML
import Vision

// MARK: - Image Classification
class ClassificationTest: ObservableObject {
    
    @Published var classificationLabel: String = "Default."
    
//    func classificationImage(for image: UIImage) -> String {
//        lazy var classificationRequest: VNCoreMLRequest =
//
//
//
//        return classificationLabel
//
//    }
    /// - Tag: MLModelSetup
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            let modelURL = Bundle.main.url(forResource: "FamousPeople", withExtension: "mlmodelc")!
            let model = try VNCoreMLModel(for: FamousPeople(contentsOf: modelURL).model)
            
            let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
                self?.processClassifications(for: request, error: error)
            })
            request.imageCropAndScaleOption = .centerCrop
            request.usesCPUOnly = true
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    /// - Tag: PerformRequests
    func updateClassifications(for image: UIImage) {
        classificationLabel = "Classifying..."
        
        let orientation = CGImagePropertyOrientation(image.imageOrientation)
        guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                print("Failed to perform classification.\n\(error.localizedDescription)")
            }
        }
    }
    
    /// Updates the UI with the results of the classification.
    /// - Tag: ProcessClassifications
    func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else {
                self.classificationLabel = "Unable to classify image.\n\(error!.localizedDescription)"
                return
            }
            // The `results` will always be `VNClassificationObservation`s, as specified by the Core ML model in this project.
            let classifications = results as! [VNClassificationObservation]
        
            if classifications.isEmpty {
                self.classificationLabel = "Nothing recognized."
            } else {
                // Display top classifications ranked by confidence in the UI.
                let topClassifications = classifications.prefix(1)
                self.classificationLabel = (topClassifications.first?.identifier)!
            }
        }
    }
}
