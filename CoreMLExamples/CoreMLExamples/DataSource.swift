//
//  DataSource.swift
//  CoreMLExamples
//
//  Created by Wei Xie on 2017-10-18.
//  Copyright © 2017 Wei Xie. All rights reserved.
//

import UIKit

enum ExampleType: String {
    case objectDetection
    case faceDetection
    case sentimentDetection
}

class Example: NSObject {
    let type: ExampleType
    let title: String
    let detail: String
    
    init(type:ExampleType, title:String, detail:String) {
        self.type = type
        self.title = title
        self.detail = detail
    }
}
