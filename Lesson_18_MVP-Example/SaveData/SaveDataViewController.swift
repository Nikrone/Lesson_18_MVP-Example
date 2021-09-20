//
//  ViewController.swift
//  Lesson_18_MVP-Example
//
//  Created by Evgeniy Nosko on 20.09.21.
//

import UIKit

// AnyObject - применяется только к класам!
protocol SaveDataViewProtocol: AnyObject {
    func showNextScreen(with string: String, delegate: SaveDataPresenterDelegate?)
    func clearTextField()
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
        presenter.saveStringToUserDefaults(string: string)
    }
    
}



extension SaveDataViewController: SaveDataViewProtocol {
    func showNextScreen(with string: String, delegate: SaveDataPresenterDelegate?) {
        let storyboard = UIStoryboard(name: "ViewData", bundle: Bundle.main)
        guard let viewDataViewController =  storyboard.instantiateViewController(identifier: "ViewDataViewController") as? ViewDataViewController else { return }
        
//        создание презентера
        viewDataViewController.presenter = ViewDataPresenter(string: string, delegate: delegate)
        navigationController?.pushViewController(viewDataViewController, animated: true)
    }
    
    func clearTextField() {
        textField.text = ""
    }
}
