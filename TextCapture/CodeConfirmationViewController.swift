//
//  CodeConfirmationViewController.swift
//  TextCapture
//
//  Created by Misa.Pham on 10/5/18.
//  Copyright © 2018 Findo Inc. All rights reserved.
//

import Foundation

class CodeConfirmationViewController: UIViewController {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var scanAgainButton: UIButton!
    @IBOutlet weak var manualButton: UIButton!
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet var codeLabel: UILabel!
    var code: String?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setGradientBackground()
        setButtonColors()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let code = code {
            let formattedCode = String(code.enumerated().map { [" ", $1]}.joined())
            
            codeLabel.text = formattedCode
        }
    }
    static func viewController() -> CodeConfirmationViewController? {
        return UIStoryboard(name: "CodeConfirmation", bundle: Bundle.main).instantiateInitialViewController() as? CodeConfirmationViewController
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
    
    func setButtonColors() {
        continueButton.backgroundColor = UIColor(red:0.00, green:0.70, blue:0.92, alpha:1.0)
        scanAgainButton.backgroundColor = UIColor(red:0.00, green:0.70, blue:0.92, alpha:1.0)
        manualButton.backgroundColor = UIColor(red:0.00, green:0.70, blue:0.92, alpha:1.0)
    }
}
