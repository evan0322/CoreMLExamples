//
//  GenderClassificationViewController.swift
//  CoreMLExamples
//
//  Created by Wei Xie on 2017-10-18.
//  Copyright © 2017 Wei Xie. All rights reserved.
//

import UIKit
import CoreML


class ObjectDetectionViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "🤔"
    }
    
    func process(_ image: UIImage) {
        imageView.image = image
        
        guard let pixelBuffer = image.pixelBuffer(width: 299, height: 299) else {
            return
        }
        //I have `Use of unresolved identifier 'Inceptionv3'` error here when I use New Build System (File > Project Settings)   ¯\_(ツ)_/¯
        let model = Inceptionv3()
        do {
            let output = try model.prediction(image: pixelBuffer)
            let probs = output.classLabelProbs.sorted { $0.value > $1.value }
            if let prob = probs.first {
                label.text = "\(prob.key) \(prob.value)"
            }
        }
        catch {
            self.presentAlertController(withTitle: title,
                                        message: error.localizedDescription)
        }
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerController.sourceType = .camera
        }
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
}

extension ObjectDetectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
            return
        }
        process(image)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
