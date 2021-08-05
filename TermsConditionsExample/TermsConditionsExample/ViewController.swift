//
//  ViewController.swift
//  TermsConditionsExample
//
//  Created by Jeann Luiz Chuab on 05/08/21.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setupTermsConditionLabel() {
        let termsOfUseURLString = "https://foo.co/termsofservice"
        let privacyPolicyURLString = "https://foo.co/privacypolicy"
        let termsText = "Terms"
        let privacyText = "Privacy Policy"
        
        let textAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
                              NSAttributedString.Key.foregroundColor: UIColor.brown]
        
        let legalLinkAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                                                                  NSAttributedString.Key.underlineColor: UIColor.brown]
        
        let aString = NSMutableAttributedString(string: textView.text ?? "", attributes: textAttributes)
        var foundRange = aString.mutableString.range(of: termsText)
        aString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: foundRange)
        aString.addAttribute(NSAttributedString.Key.link, value: termsOfUseURLString, range: foundRange)
        aString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.brown, range: foundRange)
        
        foundRange = aString.mutableString.range(of: privacyText)
        aString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: foundRange)
        aString.addAttribute(NSAttributedString.Key.link, value: privacyPolicyURLString, range: foundRange)
        aString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.brown, range: foundRange)
        
        textView.attributedText = aString
        textView.linkTextAttributes = legalLinkAttributes
    }
}

