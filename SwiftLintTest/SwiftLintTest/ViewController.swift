//
//  ViewController.swift
//  SwiftLintTest
//
//  Created by Jeann Luiz Chuab on 23/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    
    let test1: String?
    let test3: String?
    
    override func viewDidLoad()     {
        super.viewDidLoad()
        

        //Option 1
        if let name = textFieldName.text {
            createUser(name: name, senha: "1234156")
        }
        
        //Option 2
        createUser(name: (textFieldName.text ?? ""), senha: "123456")
    }
    
    func createUser(name: String, email: String, senha: String) {
        
        let json = ["name": name,
                    "email": email,
                    "password": senha]
        
        print(json)
        
    }


}

