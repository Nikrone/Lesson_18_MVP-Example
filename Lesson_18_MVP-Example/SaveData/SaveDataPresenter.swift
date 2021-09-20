//
//  SaveDataPresenter.swift
//  Lesson_18_MVP-Example
//
//  Created by Evgeniy Nosko on 20.09.21.
//

import Foundation

//MVP - не зависим от UIKit!
//Presenter-НЕ должен знать UI элементы!
//Протокол содержит в себе функцию, но не содержит ее логику!

protocol SaveDataPresenterProtocol {
    var view: SaveDataViewProtocol? { get set }
    
    func viewDidLoad()
    func saveStringToUserDefaults (string: String)
   
    
}

protocol SaveDataPresenterDelegate: AnyObject {
    func clearStringFromUserDefaults()
}

class SaveDataPresenter : SaveDataPresenterProtocol, SaveDataPresenterDelegate {
    weak var view: SaveDataViewProtocol?
    
    func viewDidLoad() {
    }
    
    func saveStringToUserDefaults (string: String) {
        UserDefaults.standard.setValue(string, forKey: Consants.stringKey)
        view?.showNextScreen(with: string, delegate: self)
    }
    
    func clearStringFromUserDefaults()  {
        UserDefaults.standard.removeObject(forKey: Consants.stringKey)
        view?.clearTextField()
    }
    
}
