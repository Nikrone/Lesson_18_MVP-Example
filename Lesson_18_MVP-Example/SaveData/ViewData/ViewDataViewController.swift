//
//  ViewDataViewController.swift
//  Lesson_18_MVP-Example
//
//  Created Evgeniy Nosko on 20.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ViewDataViewController: UIViewController {
    @IBOutlet private weak var textLabel: UILabel!

	var presenter: ViewDataPresenterProtocol!

	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
    }
    
    @IBAction func buttonPressed2() {
        presenter.clearAndGoBack()
    }

}

extension ViewDataViewController: ViewDataViewProtocol {
    func updateTextLabel(with string: String) {
        textLabel.text = string
    }
    
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
