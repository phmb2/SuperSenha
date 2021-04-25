//
//  ViewController.swift
//  SuperSenha
//
//  Created by Pedro Barbosa on 15/03/21.
//  Copyright © 2021 Pedro Barbosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLowercaseLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swUppercaseLetters: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    
    @IBOutlet weak var btnGeneratePasswords: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordViewController

        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            if numberOfPasswords <= 0 || numberOfPasswords > 99 {
                showAlert(message: "Valor inválido! Digite um valor entre 1 e 99 para Quantidade de senhas.")
            } else {
                passwordsViewController.numberOfPasswords = numberOfPasswords
            }
        } else {
            showAlert(message: "Digite um valor entre 1 e 99 para Quantidade de senhas.")
        }
        
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
            if numberOfCharacters <= 0 || numberOfCharacters > 16 {
                showAlert(message: "Valor inválido. Digite um valor entre 1 e 16 para Total de caracteres.")
            } else {
                passwordsViewController.numberOfCharacters = numberOfCharacters
            }
        } else {
            showAlert(message: "Digite um valor entre 1 e 16 para Total de caracteres.")
        }
        
        if btnGeneratePasswords.isEnabled {
            passwordsViewController.useNumbers = swNumbers.isOn
            passwordsViewController.useUppercaseLetters = swUppercaseLetters.isOn
            passwordsViewController.useLowercaseLetters = swLowercaseLetters.isOn
            passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        }
        
        view.endEditing(true)
    }
    
    @IBAction func swLowercaseLettersChanged(_ sender: UISwitch) {
        swLowercaseLetters.isOn = sender.isOn
        enableGeneratePasswordsButton()
    }
    
    @IBAction func swNumbersChanged(_ sender: UISwitch) {
        swNumbers.isOn = sender.isOn
        enableGeneratePasswordsButton()
    }
    
    @IBAction func swUppercaseLettersChanged(_ sender: UISwitch) {
        swUppercaseLetters.isOn = sender.isOn
        enableGeneratePasswordsButton()
    }
    
    @IBAction func swSpecialCharacteresChanged(_ sender: UISwitch) {
        swSpecialCharacters.isOn = sender.isOn
        enableGeneratePasswordsButton()
    }
    
    func enableGeneratePasswordsButton() {
        if (swNumbers.isOn || swUppercaseLetters.isOn || swLowercaseLetters.isOn || swSpecialCharacters.isOn) {
            btnGeneratePasswords.isEnabled = true
        } else {
            btnGeneratePasswords.isEnabled = false
        }
    }
    
    func showAlert(message: String) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true) {
                print("Alert dismiss")
            }
        }))
        
        present(alert, animated: true, completion: nil)
    }
}
