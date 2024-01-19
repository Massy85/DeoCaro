//
//  ProvaViewController.swift
//  Classi&Funzioni
//
//  Created by Massimiliano Bonafede on 19/01/24.
//

import UIKit

class ProvaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let bmw: Auto = Auto(brand: "bmw serie 1", motors: 20.0)
        bmw.viaggio(km: 100)
       
        bmw.viaggio(km: 1000)
        
        bmw.viaggio(km: 5000)
        
    }
}

class Auto {
    
    // MARK: - Properties

    let brand: String
    let motors: Double
    var statoGomme: Double = 100
    var kmTotali: Double = 0.0
    var litriTotali: Double = 0.0
    
    // MARK: - Lifecycle

    init(brand: String, motors: Double) {
        self.brand = brand
        self.motors = motors
    }
    
    // MARK: - Methods

    func consumi() -> Double {
        return 25.0
    }
    
    func viaggio(km: Double) {
        let consumo = km/consumi()
        print("Hai consumato \(consumo) litri")
        usuraGomme(km: km)
        kmTotali = kmTotali + km
        litriTotali = litriTotali + consumo
        print("Hai \(kmTotali) km e i litri totali sono \(litriTotali)")
    }
    
    func usuraGomme(km: Double) {
        let usura: Double = km / 100
        statoGomme = statoGomme - usura
        print("Hai consumato \(usura) mm e lo stato attuale è al \(statoGomme)")
    }
}
