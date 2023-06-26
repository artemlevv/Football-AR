//
//  DetectViewController.swift
//  Football AR
//
//  Created by ARTEM on 22.06.2023.
//

import UIKit
import Vision
import AVFoundation
import ImageIO

class DetectViewController: UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBAction func takePhoto(_ sender: Any) {
        // Show options for the source picker only if the camera is available.
              guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                  presentPhotoPicker(sourceType: .photoLibrary)
                  return
              }
                
              let photoSourcePicker = UIAlertController()
              let takePhoto = UIAlertAction(title: "Take Photo", style: .default) { [unowned self] _ in
                  self.presentPhotoPicker(sourceType: .camera)
              }
              let choosePhoto = UIAlertAction(title: "Choose Photo", style: .default) { [unowned self] _ in
                  self.presentPhotoPicker(sourceType: .photoLibrary)
              }
                
              photoSourcePicker.addAction(takePhoto)
              photoSourcePicker.addAction(choosePhoto)
              photoSourcePicker.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
              present(photoSourcePicker, animated: true)
    }
    
    lazy var classificationRequest: VNCoreMLRequest = {
           do {
               /*
                Use the Swift class `MobileNet` Core ML generates from the model.
                To use a different Core ML classifier model, add it to the project
                and replace `MobileNet` with that model's generated Swift class.
                */
               let model = try VNCoreMLModel(for: PL_Club_Logos().model)
                 
               let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
                   self?.processClassifications(for: request, error: error)
               })
               request.imageCropAndScaleOption = .centerCrop
               return request
           } catch {
               fatalError("Failed to load Vision ML model: \(error)")
           }
    }()
    func updateClassifications(for image: UIImage) {
            classificationLabel.text = "Classifying..."
              
            let orientation = CGImagePropertyOrientation(image.imageOrientation)
            guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }
              
            DispatchQueue.global(qos: .userInitiated).async {
                let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
                do {
                    try handler.perform([self.classificationRequest])
                } catch {
                    /*
                     This handler catches general image processing errors. The `classificationRequest`'s
                     completion handler `processClassifications(_:error:)` catches errors specific
                     to processing that request.
                     */
                    print("Failed to perform classification.\n\(error.localizedDescription)")
                }
            }
        }
    func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
                guard let results = request.results as? [VNObservation],
                      !results.isEmpty else {
                    self.classificationLabel.text = "No recognized objects found."
                    return
                }
                
                var detectedLabel: String?
                var confidence: Float = 0.0
                
                for observation in results {
                    if let recognizedObject = observation as? VNRecognizedObjectObservation,
                       let firstLabel = recognizedObject.labels.first {
                        detectedLabel = firstLabel.identifier
                        confidence = firstLabel.confidence
                        break
                    }
                }
                
                if let label = detectedLabel {
                    self.classificationLabel.text = "\(label)"
                    //self.showCLubInfoController(clubName: label)
                    self.presentModal(clubName: label)
                } else {
                    self.classificationLabel.text = "No recognized objects found."
                }
            }
       }
    func presentPhotoPicker(sourceType: UIImagePickerController.SourceType) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = sourceType
            present(picker, animated: true)
    }
    
    func showCLubInfoController(clubName: String){
        let infoController = ClubInfoViewController(clubName: clubName)
        if let sheet = infoController.sheetPresentationController{
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
        self.present(infoController, animated: true, completion: nil)
    }
    private func presentModal(clubName: String) {
        let detailViewController = ClubInfoViewController(clubName: clubName)
        let nav = UINavigationController(rootViewController: detailViewController)
        // 1
        nav.modalPresentationStyle = .pageSheet

        
        // 2
        if let sheet = nav.sheetPresentationController {

            // 3
            sheet.detents = [.medium(), .large()]

        }
        // 4
        present(nav, animated: true, completion: nil)

    }
}
extension DetectViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - Handling Image Picker Selection
      
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
          
        // We always expect `imagePickerController(:didFinishPickingMediaWithInfo:)` to supply the original image.
        guard let image = info[.originalImage] as? UIImage else{
            print("Error in picker")
            return}
        print(imageView.image?.size)
        imageView.image = image
        print(imageView.image?.size)
        updateClassifications(for: image)
    }
}

extension CGImagePropertyOrientation {
    /**
     Converts a `UIImageOrientation` to a corresponding
     `CGImagePropertyOrientation`. The cases for each
     orientation are represented by different raw values.
      
     - Tag: ConvertOrientation
     */
    init(_ orientation: UIImage.Orientation) {
        switch orientation {
            case .up: self = .up
            case .upMirrored: self = .upMirrored
            case .down: self = .down
            case .downMirrored: self = .downMirrored
            case .left: self = .left
            case .leftMirrored: self = .leftMirrored
            case .right: self = .right
            case .rightMirrored: self = .rightMirrored
        }
    }
}
