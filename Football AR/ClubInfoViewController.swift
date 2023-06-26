//
//  ClubInfoViewController.swift
//  Football AR
//
//  Created by ARTEM on 23.06.2023.
//

import UIKit
import SwiftUI

class ClubInfoViewController: UIViewController{
    public var clubName: String
    
    init(clubName: String) {
        self.clubName = clubName
        print(self.clubName)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*override func viewDidLoad() {
            super.viewDidLoad()
            let vc = UIHostingController(rootView: ClubInfoView(clubName: self.clubName))
            DispatchQueue.main.async { [weak self] in
                self?.present(vc, animated: false, completion: nil)
            }
        }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        let vc = UIHostingController(rootView: ClubInfoView(clubName: self.clubName))
        
        let swiftuiView = vc.view!
        swiftuiView.translatesAutoresizingMaskIntoConstraints = false
        
        // 2
        // Add the view controller to the destination view controller.
        addChild(vc)
        view.addSubview(swiftuiView)
        
        // 3
        // Create and activate the constraints for the swiftui's view.
        NSLayoutConstraint.activate([
            swiftuiView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            swiftuiView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            swiftuiView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            swiftuiView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        
        // 4
        // Notify the child view controller that the move is complete.
        vc.didMove(toParent: self)
    }
}
