//
//  ViewController.swift
//  Classi&Funzioni
//
//  Created by Massimiliano Bonafede on 18/01/24.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var ammountTextField: UITextField!
    @IBOutlet weak var contoLabel: UILabel!
    @IBOutlet weak var esitoLabel: UILabel!
    
    // MARK: - Properties
    
    let user = User(name: "Stefano", age: 37)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        esitoLabel.text = ""
        userLabel.text = "\(user.name) - \(user.age)"
        contoLabel.text = "\(user.conto)"
    }

    // MARK: - Methods
    
    
    // MARK: - Actions

    @IBAction func prelevaButtonWasPressed(_ sender: UIButton) {
        let ammount = Double(ammountTextField.text ?? "") ?? 0.0
        let esito = user.preleva(ammount: ammount)
        contoLabel.text = "\(user.conto)"
        esitoLabel.text = user.esito
        
        if esito {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.esitoLabel.text = ""
                self.ammountTextField.text = ""
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                self.esitoLabel.text = ""
                self.ammountTextField.text = ""
            }
        }
    }
    
    @IBAction func depositaButtonWasPressed(_ sender: UIButton) {
        let ammount = Double(ammountTextField.text ?? "") ?? 0.0
        user.deposita(ammount: ammount)
        contoLabel.text = "\(user.conto)"
        esitoLabel.text = user.esito
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.esitoLabel.text = ""
            self.ammountTextField.text = ""
        }
    }
}


class User {
    
    // MARK: - Properties

    let name: String
    var age: Int
    var conto: Double = 0.0
    var esito: String = ""
    
    // MARK: - Lifecycle

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // MARK: - Methods

    func deposita(ammount: Double) {
        conto = conto + ammount
        esito = "Deposito andanto a buon fine"
    }
    
    func preleva(ammount: Double) -> Bool {
        if conto > ammount {
            conto = conto - ammount
            esito = "Prelievo andado a buon fine, saldo rimanente \(conto)€"
            return true
        } else {
            esito = "Non è possibile prelevare \(ammount)€, saldo disponibile \(conto)€"
            return false
        }
    }
}


class Animale {
    
    let razza: String
    var age: Int
    let isMale: Bool
    
    init(razza: String, age: Int, isMale: Bool) {
        self.razza = razza
        self.age = age
        self.isMale = isMale
    }
    
    func isTheAnimaleMale() -> Bool {
        return isMale
    }
}

