//
//  ViewController.swift
//  SignatureView
//
//  Created by Jeann Luiz on 12/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signatureView: Canvas!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        signatureView.setStrokeColor(color: .black)
    }

    func setupViews(){
        signatureView.layer.borderWidth = 0.5
        signatureView.layer.borderColor = UIColor.black.cgColor
        signatureView.layer.cornerRadius = 10
    }

    @IBAction func clearBtnTapped(_ sender: UIButton) {
        signatureView.clear()
    }
    
    @IBAction func undoBtnTapped(_ sender: UIButton) {
        signatureView.undo()
    }
    
    @IBAction func exportBtnTapped(_ sender: UIButton) {
        let image  = signatureView.getImage()
        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: image)
    }
    
    @IBAction func addTextToImage(_ sender: Any) {
        
        let image = signatureView.getImage()
        let imageWithText = image.textToImage(drawText: textField.text ?? "Default text", inImage: image)
        
//        signatureView.
        
//        let imageSaver = ImageSaver()
//
//        imageSaver.writeToPhotoAlbum(image: imageWithText)

        
//        let imageExport = UIImage.createImageWithLabelOverlay(label: label, image: image)
//
//        let imageSaver = ImageSaver()
//        imageSaver.writeToPhotoAlbum(image: imageExport)
    }
         
}



