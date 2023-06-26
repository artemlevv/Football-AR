//
//  ViewController.swift
//  Football AR
//
//  Created by ARTEM on 14.06.2023.
//

import UIKit
import ARKit
import SceneKit

class FaceMaskViewController: UIViewController, ARSessionDelegate {
    
    var clubName: String = ""
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var sceneView: ARSCNView!
    
    var faceAnchorsAndContentControllers: [ARFaceAnchor: VirtualContentController] = [:]
    
    
    @IBAction func takePhotoSnapshot(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
                   self.photoButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                   self.photoButton.alpha = 0.5
        }) { (_) in
                   UIView.animate(withDuration: 0.3) {
                       self.photoButton.transform = .identity
                       self.photoButton.alpha = 1.0
            }
        }
        
        let image = sceneView.snapshot()
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.session.delegate = self
        sceneView.automaticallyUpdatesLighting = true
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // AR experiences typically involve moving the device without
        // touch input for some time, so prevent auto screen dimming.
        UIApplication.shared.isIdleTimerDisabled = true
        
        // "Reset" to run the AR session for the first time.
        resetTracking()
    }
    
    /// - Tag: ARFaceTrackingSetup
    func resetTracking() {
        guard ARFaceTrackingConfiguration.isSupported else { return }
        let configuration = ARFaceTrackingConfiguration()
        if #available(iOS 13.0, *) {
            configuration.maximumNumberOfTrackedFaces = ARFaceTrackingConfiguration.supportedNumberOfTrackedFaces
        }
        configuration.isLightEstimationEnabled = true
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        
        //faceAnchorsAndContentControllers.removeAll()
    }
    
    // Auto-hide the home indicator to maximize immersion in AR experiences.
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    // Hide the status bar to maximize immersion in AR experiences.
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // Handle the error condition
            print("Error saving photo: \(error.localizedDescription)")
        } else {
            // Photo saved successfully
            print("Photo saved successfully")
        }
    }

}

extension FaceMaskViewController: ARSCNViewDelegate {
        
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor else { return }
        
        // If this is the first time with this anchor, get the controller to create content.
        // Otherwise (switching content), will change content when setting `selectedVirtualContent`.
        DispatchQueue.main.async {
            let contentController = FaceMask(clubName: self.clubName)
            if node.childNodes.isEmpty, let contentNode = contentController.renderer(renderer, nodeFor: faceAnchor) {
                node.addChildNode(contentNode)
                self.faceAnchorsAndContentControllers[faceAnchor] = contentController
            }
        }
    }
    
    /// - Tag: ARFaceGeometryUpdate
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor,
            let contentController = faceAnchorsAndContentControllers[faceAnchor],
            let contentNode = contentController.contentNode else {
            return
        }
        
        contentController.renderer(renderer, didUpdate: contentNode, for: anchor)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor else { return }
        
        faceAnchorsAndContentControllers[faceAnchor] = nil
    }
}

