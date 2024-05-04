//
//  PicturesViewController.swift
//  Fakestagram
//
//  Created by Grecia Escárcega on 05/04/24.
//

import UIKit

class PicturesViewController: UIViewController {
    
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var thirdCaption: UILabel!
    
    @IBOutlet weak var firstCaptionedPicture: CaptionedPictureView!
    
    var pictureType: PictureType = .dog
    var showCaption: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setPictures()
        showHideCaption()
        navigationItem.largeTitleDisplayMode = .never
        addSecondCaptionedView()
    }
    
    private func showHideCaption() {
        firstCaptionedPicture.hideCaption = showCaption
        thirdCaption.isHidden = !showCaption
    }
    
    private func setPictures() {
        let captionedPictures = pictureType.captionedPictures
        
        firstCaptionedPicture.captionPicture = captionedPictures[0]
    
        thirdImage.image = captionedPictures[2].image
        thirdCaption.text = captionedPictures[2].caption
    }
    
    private func addSecondCaptionedView() {
        let captionedPictureView = CaptionedPictureView()
        captionedPictureView.captionPicture = pictureType.captionedPictures[1]
        captionedPictureView.hideCaption = showCaption
        (firstCaptionedPicture.superview as? UIStackView)?.insertArrangedSubview(captionedPictureView, at: 1)
    }

}
