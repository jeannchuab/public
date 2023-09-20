//
//  ImageSaver.swift
//  SignatureView
//
//  Created by Jeann Luiz on 12/09/23.
//

import Foundation
import UIKit

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        
        guard let error = error else {
            print("Save finished!")
            return
        }
        
        print(error.localizedDescription)
    }
}
