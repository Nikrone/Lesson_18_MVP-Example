//
//  ViewDataPresenter.swift
//  Lesson_18_MVP-Example
//
//  Created Evgeniy Nosko on 20.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: View -
protocol ViewDataViewProtocol: AnyObject {
    func updateTextLabel(with string: String)
    func goBack()
}


// MARK: Presenter -
protocol ViewDataPresenterProtocol {
	var view: ViewDataViewProtocol? { get set }
    func viewDidLoad()
    func clearAndGoBack()
}

class ViewDataPresenter: ViewDataPresenterProtocol {
    private var string: String
    
    weak var view: ViewDataViewProtocol?
    private weak var delegate: SaveDataPresenterDelegate?
    
    
    init(string: String, delegate: SaveDataPresenterDelegate?) {
        self.string = string
        self.delegate = delegate
    }

    func viewDidLoad() {
        view?.updateTextLabel(with: string)
    }
    
    func clearAndGoBack() {
        delegate?.clearStringFromUserDefaults()
        view?.goBack()
    }
    
}
