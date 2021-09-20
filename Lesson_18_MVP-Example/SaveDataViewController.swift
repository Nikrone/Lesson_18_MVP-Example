//
//  ViewController.swift
//  Lesson_18_MVP-Example
//
//  Created by Evgeniy Nosko on 20.09.21.
//

import UIKit

// AnyObject - применяется только к класам!
protocol SaveDataViewProtocol: AnyObject {
    func showNextScreen(with string: String)
}



class SaveDataViewController: UIViewController {
    @IBOutlet private weak var textField: UITextField!
    
    var presenter: SaveDataPresenterProtocol = SaveDataPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        
    }
    
    @IBAction private func nextbuttonPressed() {
        let string = textField.text ?? ""
        presenter.saveStrinToUserDefaults(string: string)
    }
    
}



extension SaveDataViewController: SaveDataViewProtocol {
    func showNextScreen(with string: String) {
        
    }
}
