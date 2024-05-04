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
    
    @IBOutlet weak var pictureTypeSwitch: UISwitch!
    @IBOutlet weak var showCaptionSwitch: UISwitch!
    @IBOutlet weak var customTextSwitch: UISwitch!
    @IBOutlet weak var picturesButton: UIButton!
    @IBOutlet weak var customText: UITextView! {
        didSet {
            customText.delegate = self
        }
    }
    
    override func loadView() {
        // llamando una instancia de la vista
        view = Homeview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBarButtonItemGroup()
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if sender.tag == 1 {
            customText.isEditable = sender.isOn
        } else if sender == pictureTypeSwitch {
            picturesButton.setImage(UIImage(systemName: sender.isOn ? "dog.fill" : "cat.fill"), for: .normal)
        }
    }
    
    private func setBarButtonItemGroup() {
        let logoutButton = UIBarButtonItem(title: "Logout", image: UIImage(systemName: "multiply.circle.fill"), target: self, action: #selector(logout))
        let informationButton = UIBarButtonItem(title: "Information", image: UIImage(systemName: "info.circle.fill"), target: self, action: #selector(manualSegueInformation))
        self.navigationItem.centerItemGroups = [UIBarButtonItemGroup.fixedGroup(items: [informationButton, logoutButton])]
    }
    
    @objc func manualSegueInformation() {
        if customTextSwitch.isOn && (customText.text?.isEmpty ?? true) {
            let alertController = UIAlertController(title: "Add custom text", message: nil, preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Ok", style: .cancel) { _ in
                print("Alert controller dismissed")
            }
            alertController.addAction(dismissAction)
            present(alertController, animated: true)
        } else {
            // utilizando la vista manual que creamos en setTextViewConstrains
            let informationViewController = InformationViewController()
            if customTextSwitch.isOn {
                informationViewController.text = customText.text
            }
            present(informationViewController, animated: true)
        }
    }
    
    @objc func logout() {
        navigationController?.dismiss(animated: true)
    }
    
    @IBAction func manualSeguePictures(_ sender: UIButton) {
        let picturesViewController = PicturesViewController(nibName: nil, bundle: nil)
        picturesViewController.pictureType = pictureTypeSwitch.isOn ? .dog : .cat
        picturesViewController.showCaption = showCaptionSwitch.isOn
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


