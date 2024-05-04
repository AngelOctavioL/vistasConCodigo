//
//  PictureType.swift
//  Fakestagram
//
//  Created by Grecia Escárcega on 05/04/24.
//

import UIKit

enum PictureType {
    case dog, cat
    
    var captionedPictures: [CaptionedPicture] {
        switch self {
        case .dog: return [
            CaptionedPicture(image: .dog1, caption: "dog-1"),
            CaptionedPicture(image: UIImage(resource: .dog2Jpg), caption: "dog-2"),
            CaptionedPicture(image: .dog3, caption: "dog-3")
        ]
        case .cat: return [
            CaptionedPicture(image: .images2, caption: "cat-1"),
            CaptionedPicture(image: .images3, caption: "cat-2"),
            CaptionedPicture(image: .images4, caption: "cat-2")
            ]
        }
    }
    
}
