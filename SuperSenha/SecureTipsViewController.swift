//
//  SecureTipsViewController.swift
//  SuperSenha
//
//  Created by Pedro Barbosa on 16/03/21.
//  Copyright © 2021 Pedro Barbosa. All rights reserved.
//

import UIKit

class SecureTipsViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var textView: UITextView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        isModalInPresentation = true
        
        if let filepath = Bundle.main.path(forResource: "DicasSenha", ofType: "txt") {
            
            let contents = try? String(contentsOfFile: filepath)
            textView.text = contents ?? "Não foi possível carregar o arquivo."
        }
    }

    // MARK: - Actions
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
