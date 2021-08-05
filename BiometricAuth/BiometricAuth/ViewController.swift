//
//  ViewController.swift
//  BiometricAuth
//
//  Created by Jeann Luiz Chuab on 07/07/21.
//

import LocalAuthentication
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnAuth: UIButton!
    let context = LAContext()
    var error: NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingBioAuthLabel()
    }
    
    @IBAction func actionBtnAuth(_ sender: Any) {
        let reason = "Please authorize with TouchId"
        
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: { [weak self] sucess, error in
            DispatchQueue.main.async {
                if sucess {
                    self?.openWelcomeScreen()
                } else {
                    let alert = UIAlertController(title: "Failed to authenticate", message: "Please try again.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(alert, animated: true)
                }
            }
        })
    }
    
    func settingBioAuthLabel(){
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            if self.context.biometryType == .faceID {
                self.btnAuth.setTitle("Login with Face id", for: .normal)
            } else if self.context.biometryType == .touchID {
                self.btnAuth.setTitle("Login with Touch id", for: .normal)
            } else {
                self.btnAuth.setTitle("Bio auth not enabled", for: .normal)
            }
        } else {
            self.btnAuth.setTitle("Bio auth not enabled", for: .normal)
        }
    }
    
    func openWelcomeScreen(){
        let viewController = UIViewController()
        viewController.title = "Welcome!"
        viewController.view.backgroundColor = .yellow
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
