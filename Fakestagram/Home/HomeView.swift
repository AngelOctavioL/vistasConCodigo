//
//  HomeView.swift
//  Fakestagram
//
//  Created by Diplomado on 03/05/24.
//

import UIKit

class Homeview: UIView {
    // usamos lazy cuando vamos a asignar propiedades
    private lazy var stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        // spacing es el espaciado entre los elementos hijos
        stackView.spacing = 16
        // insents es el margen entre los elementos vecinos
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        // la linea de abajo es para que nos respete los margenes que le estamos poniendo
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    var pictureTypeSwitch = UISwitch()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setStackContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStackContainer() {
        addSubview(stackViewContainer)
        NSLayoutConstraint.activate([
            stackViewContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackViewContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackViewContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackViewContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func createPictureTypeConfiguration() -> UIStackView {
        let stackView = createHorizontalStackView()
        let catLabel = createBasicLabel(text: "Cat")
        catLabel.textAlignment = .center
        let dogLabel = createBasicLabel(text: "Dog")
        dogLabel.textAlignment = .center
        
        // juntando todos los elementos
        stackView.addArrangedSubview(catLabel)
        stackView.addArrangedSubview(pictureTypeSwitch)
        stackView.addArrangedSubview(dogLabel)
        // poniendo el ancho a los labels
        dogLabel.widthAnchor.constraint(equalTo: catLabel.widthAnchor, multiplier: 1).isActive = true
        return stackView
    }
    
    private func createHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }
    
    private func createBasicLabel(text: String, useTamic: Bool = false) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = useTamic
        label.text = text
        return label
    }
}
