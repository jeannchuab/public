//
//  CustomViewController.swift
//  TesteNavigation
//
//  Created by Jeann Luiz Chuab on 15/06/21.
//

import UIKit

class CustomViewController: UIViewController {

    var customColor: UIColor = .yellow
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = customColor
    }
}
