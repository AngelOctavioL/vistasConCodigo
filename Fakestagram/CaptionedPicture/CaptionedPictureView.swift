//
//  CaptionedPictureView.swift
//  Fakestagram
//
//  Created by Grecia Escárcega on 12/04/24.
//

import UIKit

class CaptionedPictureView: UIView {
    // creando los elementos de la vista
    
    // creando el stack
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        // deshabilitando los contrains por default
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    // creando la imagen
    private lazy var picture: UIImageView = {
       let imageView = UIImageView()
        // para ver cuando se va se va a comprimir la imagen
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        imageView.contentMode = .scaleAspectFit
        // para que la imagen se ajuste bien si es muy pequeña
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var caption: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    var hideCaption: Bool = false {
        didSet {
            caption.isHidden = hideCaption
        }
    }
    
    var captionPicture: CaptionedPicture? {
        didSet {
            caption.text = captionPicture?.caption
            picture.image = captionPicture?.image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStackView()
    }
    
    
    // dandole los contrains al stackView
    private func setStackView() {
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        // agregando los elementos a la pila
        // los stack views tienen su propia propiedad (addArrangedSubview) para agregar elementos dentro de el
        stackView.addArrangedSubview(picture)
        stackView.addArrangedSubview(caption)
    }
    
}
