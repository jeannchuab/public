//
//  ViewController.swift
//  TesteNavigation
//
//  Created by Jeann Luiz Chuab on 14/06/21.
//

import UIKit

enum Materia {
    case matematica
    case literatura
    case geografia
}

class ViewController: UIViewController {
    
    @IBOutlet weak var switchColor: UISwitch!
    @IBOutlet weak var labelRed: UILabel!
    @IBOutlet weak var labelGreen: UILabel!
    
    let textColor = "Color"
    let textColorRed = "Color: Red"
    let textColorGreen = "Color: Green"
    
    let dict: [String:Int] = ["Jeann":1, "Lanes": 10, "Clara": 11, "Zé Luiz": 100]
    
    let materias = [Materia.geografia : 4, Materia.matematica: 5]
            
    let propriedades : [String:String] = ["Font": "Herlvetica", "Style": "Bold", "Color": "Black"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let value = dict["Clara"] {
            print(value)
        }
        
        if let value = dict["Clara"] {
            print(value)
        }
        
        
        
//        labelRed.text = textColorRed
//        labelGreen.text = textColorGreen
        
        
//        let atributoFonte = UIFont(name: "HelveticaNeue", size: 14.0)!
//
//        let attributedString = NSMutableAttributedString(string: "Hizentra App version X.X.X\nPowered by CSL Behring LLC.",
//                                                         attributes: [ .font: atributoFonte,                                                                            .foregroundColor: UIColor.brown,
////                                                                       .kern: 0.0
//                                                                      ])
//        attributedString.addAttribute(.font, value: UIFont(name: "HelveticaNeue-Bold", size: 14.0)!, range: NSRange(location: 0, length: 12))
        
        
        if let boldFont = UIFont(name: "HelveticaNeue-Bold", size: 14), let regularFont = UIFont(name: "HelveticaNeue", size: 14) {
    //        let attribute: [NSAttributedString]
            let attributeRegular: [NSAttributedString.Key : Any] = [.font: regularFont]
//                    let attributeBold: [NSAttributedString.Key : Any] = [.font: boldFont]
//                    let attributeRed: [NSAttributedString.Key : Any] = [.font: regularFont, .foregroundColor: UIColor.red]
    //        let attributeGree: [NSAttributedString.Key : Any] = [.font: boldFont, .foregroundColor: UIColor.green]
            
            let textoFinalRed = NSMutableAttributedString(string: textColorRed, attributes: attributeRegular)
            
            textoFinalRed.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 7, length: 3))
            textoFinalRed.addAttribute(.font, value: boldFont, range: NSRange(location: 0, length: textColor.count))
                    
                    
                    //        let attributedString = NSAttributedString(
                    
            labelRed.attributedText = textoFinalRed

        }
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


