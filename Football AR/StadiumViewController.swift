//
//  StadiumViewController.swift
//  Football AR
//
//  Created by ARTEM on 21.06.2023.
//

import Foundation
import ARKit
import SceneKit

class StadiumViewController: UIViewController, ARSCNViewDelegate{
    @IBOutlet weak var sceneView: ARSCNView!
    var virtualBackgroundNode = SCNNode()
    
    //MARK: _ CHANGE IT
    let uiImage: UIImage = UIImage(named: "wembl")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setConfig()
    }
    
    func setConfig(){
        let config = ARFaceTrackingConfiguration()
              if ARFaceTrackingConfiguration.supportsFrameSemantics(.personSegmentation) {
                    config.frameSemantics.insert(.personSegmentation)
              } else {
                   //Present Alert
              }
         sceneView.session.run(config, options: [])
        let width = uiImage.size.width
        let height = uiImage.size.height
        let mediaAspectRatio = Double(width / height)
        let cgImage = uiImage.cgImage
        let newUiImage = UIImage(cgImage: cgImage!, scale: 0.5, orientation: .up)

        let skScene = SKScene(size: CGSize(width: 1000  * mediaAspectRatio, height: 1000))
        let texture = SKTexture(image:uiImage)
        let skNode = SKSpriteNode(texture:texture)
        skNode.position = CGPoint(x: skScene.size.width / 2.0, y: skScene.size.height / 2.0)
        skNode.size = skScene.size
        skNode.yScale = -1.0
        skScene.addChild(skNode)
        
        virtualBackgroundNode.geometry = SCNPlane(width: sceneView.frame.width, height: sceneView.frame.height)
        let material = SCNMaterial()
        material.diffuse.contents = skScene
        virtualBackgroundNode.geometry?.materials = [material]
        virtualBackgroundNode.scale = SCNVector3(1.7  * mediaAspectRatio, 1.7, 1)
        sceneView.scene.rootNode.addChildNode(virtualBackgroundNode)
        
        let cameraPosition = sceneView.pointOfView?.scale
        let position = SCNVector3(cameraPosition!.x, cameraPosition!.y + 100, cameraPosition!.z - 300)
        virtualBackgroundNode.position = position
    }
}
