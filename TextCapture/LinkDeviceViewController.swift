//
//  LinkDeviceViewController.swift
//  TextCapture
//
//  Created by Misa.Pham on 10/5/18.
//  Copyright © 2018 Findo Inc. All rights reserved.
//

import Foundation

class LinkDeviceViewController : UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var linkDeviceButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackground()
        setNavigationBarStyle()
        linkDeviceButton.backgroundColor = UIColor(red:0.00, green:0.70, blue:0.92, alpha:1.0)
    }
    
    func setNavigationBarStyle() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0).cgColor, UIColor(red:0.00, green:0.29, blue:0.46, alpha:1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        
        self.backgroundView.layer.insertSublayer(gradientLayer, at: 0)
    }
}
