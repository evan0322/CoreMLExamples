//
//  SpamDetectionViewController.swift
//  CoreMLExamples
//
//  Created by Wei Xie on 2017-10-18.
//  Copyright © 2017 Wei Xie. All rights reserved.
//

import UIKit
import CoreML

class SentimentDetectionViewController: UIViewController, UITextViewDelegate {
    let classificationService = ClassificationService()
    
    @IBOutlet weak var inputTextView: UITextView!
    
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextView.delegate = self

        resultLabel.backgroundColor = UIColor.blue
        resultLabel.text = "😐"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidChange(_ textView: UITextView) {
        guard let text = textView.text else {
            return
        }
        
        let sentiment = classificationService.predictSentiment(from: text)
        show(sentiment: sentiment)
    }
    
    func show(sentiment: Sentiment) {
        self.resultLabel.backgroundColor = sentiment.color
        self.resultLabel.text = sentiment.emoji
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
