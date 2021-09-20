//
//  SaveDataPresenter.swift
//  Lesson_18_MVP-Example
//
//  Created by Evgeniy Nosko on 20.09.21.
//

import Foundation
import UIKit

//MVP - 
//Presenter-НЕ должен знать UI элементы!
//Протокол содержит в себе функцию, но не содержит ее логику!

protocol SaveDataPresenterProtocol {
    var view: SaveDataViewProtocol? { get set }
    
    func viewDidLoad()
    func saveStrinToUserDefaults (string: String)
}

class SaveDataPresenter : SaveDataPresenterProtocol {
    weak var view: SaveDataViewProtocol?
    func viewDidLoad() {
    }
    
    func saveStrinToUserDefaults (string: String) {
        UserDefaults.standard.setValue(string, forKey: Consants.stringKey)
    }
    
}
