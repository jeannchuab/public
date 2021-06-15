//
//  ViewController.swift
//  TesteNavigation
//
//  Created by Jeann Luiz Chuab on 14/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switchColor: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueCustom" {
            if let destination = segue.destination as? CustomViewController {
                if switchColor.isOn {
                    //call green
                    destination.customColor = .green
                } else {
                    //call red
                    destination.customColor = .red
                }
            }
        }
    }
    
    @IBAction func buttonPuple(_ sender: Any) {
        self.performSegue(withIdentifier: "seguePurple", sender: self)
    }
    
    @IBAction func buttonYellow(_ sender: Any) {
        self.performSegue(withIdentifier: "segueYellow", sender: self)
    }
    
    @IBAction func actionButtonColor(_ sender: Any) {
                
        //Option 1
//        let customViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CustomViewControllerID") as? CustomViewController
                
        //Option 2
//        let mainStoryboard = UIStoryboard.init(name: "Custom", bundle: Bundle.main)
//        if let customViewController = mainStoryboard.instantiateViewController(identifier: "CustomViewControllerID") as? CustomViewController {
//
//            if switchColor.isOn {
//                //call green
//                customViewController.customColor = .green
//                self.navigationController?.pushViewController(customViewController, animated: true)
//            } else {
//                //call red
//                customViewController.customColor = .red
//                self.navigationController?.pushViewController(customViewController, animated: true)
//            }
//        }
        
        //Option 3
        self.performSegue(withIdentifier: "segueCustom", sender: self)
    }
}


