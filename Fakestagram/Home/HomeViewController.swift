//
//  HomeViewController.swift
//  Fakestagram
//
//  Created by Grecia Escárcega on 05/04/24.
//

import UIKit

class HomeViewController: UIViewController {
    var customView: Homeview {
        // casteando la vista para convertirla en el tipo de dato HomeView
        return view as! Homeview
    }
    
    //@IBOutlet weak var pictureTypeSwitch: UISwitch!
    //@IBOutlet weak var showCaptionSwitch: UISwitch!
    //@IBOutlet weak var customTextSwitch: UISwitch!
    //@IBOutlet weak var picturesButton: UIButton!
//    @IBOutlet weak var customText: UITextView! {
//        didSet {
//            customText.delegate = self
//        }
//    }
    
    override func loadView() {
        // llamando una instancia de la vista
        view = Homeview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connectHomeView()
        setBarButtonItemGroup()
    }
    
    private func connectHomeView() {
        // toda esta linea es el equivalente a cuando se ligaban los botines con su accion en la interfaz grafica
        customView.pictureTypeSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        customView.picturesButton.addAction(UIAction(handler: manualSeguePictures(_:)), for: .touchUpInside)
        customView.customText.delegate = self
        customView.customTextSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        if sender.tag == 1 {
            customView.customText.isEditable = sender.isOn
        } else if sender == customView.pictureTypeSwitch {
            customView.picturesButton.setImage(UIImage(systemName: sender.isOn ? "dog.fill" : "cat.fill"), for: .normal)
        }
    }
    
    private func setBarButtonItemGroup() {
        let logoutButton = UIBarButtonItem(title: "Logout", image: UIImage(systemName: "multiply.circle.fill"), target: self, action: #selector(logout))
        let informationButton = UIBarButtonItem(title: "Information", image: UIImage(systemName: "info.circle.fill"), target: self, action: #selector(manualSegueInformation))
        self.navigationItem.centerItemGroups = [UIBarButtonItemGroup.fixedGroup(items: [informationButton, logoutButton])]
    }
    
    @objc func manualSegueInformation() {
        if customView.customTextSwitch.isOn && (customView.customText.text?.isEmpty ?? true) {
            let alertController = UIAlertController(title: "Add custom text", message: nil, preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Ok", style: .cancel) { _ in
                print("Alert controller dismissed")
            }
            alertController.addAction(dismissAction)
            present(alertController, animated: true)
        } else {
            // utilizando la vista manual que creamos en setTextViewConstrains
            let informationViewController = InformationViewController()
            if customView.customTextSwitch.isOn {
                informationViewController.text = customView.customText.text
            }
            present(informationViewController, animated: true)
        }
    }
    
    @objc func logout() {
        navigationController?.dismiss(animated: true)
    }
    
    func manualSeguePictures(_ sender: UIAction) {
        let picturesViewController = PicturesViewController(nibName: nil, bundle: nil)
        picturesViewController.pictureType = customView.pictureTypeSwitch.isOn ? .dog : .cat
        picturesViewController.showCaption = customView.showCaptionSwitch.isOn
        navigationController?.pushViewController(picturesViewController, animated: true)
    }
}

extension HomeViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet.whitespacesAndNewlines)
        let maxCharacters = 150
        let currentCharacters = textView.text.count - range.length + text.count
        return text == "" || (currentCharacters <= maxCharacters && CharacterSet(charactersIn: text).isSubset(of: allowedCharacters))
    }
}


