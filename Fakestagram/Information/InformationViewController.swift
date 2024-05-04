//
//  InformationViewController.swift
//  Fakestagram
//
//  Created by Grecia Escárcega on 05/04/24.
//

import UIKit

class InformationViewController: UIViewController {
    
    // creandolo de forma manual
    // estamos creando una funcion anonima que regresa un textView y lo almacenamos en una variable
    var informationTextView: UITextView = {
       let textView = UITextView()
        // la linea de abajo es desactivar los contrains por defaul para que no interfiera
        // con nuestros propios constrains
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 15)
        return textView
    }()
    
    // la funcion de arriba sustituye a la de abajo
    //@IBOutlet weak var customText: UITextView!
    
    var text: String? = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        informationTextView.text = text
        setTextViewConstrains()
    }
    
    // creando la vista
    private func setTextViewConstrains() {
        view.addSubview(informationTextView)
        // asignando el anclaje de la parte superior
        informationTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        // asignando lado izquierdo (se asiga de izquierda a derecha)
        informationTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        // asignando el lado derecho (se asigna de derecha a izquierda por eso es negativo)
        informationTextView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.trailingAnchor, multiplier: -16).isActive = true
        // asignando el anclaje inferior
        informationTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
    }
    
}
