//
//  UIImage+Extensions.swift
//  SignatureView
//
//  Created by Jeann Luiz on 12/09/23.
//

import Foundation
import UIKit

extension UIImage {

    //Not Working
    class func createImageWithLabelOverlay(label: UILabel, imageSize: CGSize = CGSize(width: 500, height: 500), image: UIImage) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: imageSize.width, height: imageSize.height), false, 2.0)
        let currentView = UIView.init(frame: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        let currentImage = UIImageView.init(image: image)
        currentImage.frame = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
        currentView.addSubview(currentImage)
        currentView.addSubview(label)
        currentView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    func textToImage(drawText text: String, inImage inputImage: UIImage, atPoint point: CGPoint = CGPoint(x: 10, y: 10)) -> UIImage {
        
        let textColor = UIColor.black
        let textFont = UIFont(name: "Helvetica Bold", size: 12)!

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(inputImage.size, false, scale)

        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            ] as [NSAttributedString.Key : Any]
        inputImage.draw(in: CGRect(origin: CGPoint.zero, size: inputImage.size))

        let rect = CGRect(origin: point, size: inputImage.size)
        text.draw(in: rect, withAttributes: textFontAttributes)

        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return UIImage()
        }
        
        UIGraphicsEndImageContext()
        return newImage
    }

}
