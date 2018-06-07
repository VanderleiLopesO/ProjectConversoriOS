//
//  ViewController.swift
//  AppConversores
//
//  Created by Vanderlei Lopes De Oliveira Junior on 05/06/18.
//  Copyright © 2018 Vanderlei Lopes De Oliveira Junior. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btCelsius: UIButton!
    @IBOutlet weak var btFarenheint: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbTemperature: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showNext(_ sender: UIButton) {
        switch lbTemperature.text! {
        case "Temperatura":
            lbTemperature.text = "Peso"
            btCelsius.setTitle("Kilograma", for: .normal)
            btFarenheint.setTitle("Libra", for: .normal)
        case "Peso":
            lbTemperature.text = "Moeda"
            btCelsius.setTitle("Real", for: .normal)
            btFarenheint.setTitle("Dolar", for: .normal)
        case "Moeda":
            lbTemperature.text = "Temperatura"
            btCelsius.setTitle("Celsius", for: .normal)
            btFarenheint.setTitle("Farenheint", for: .normal)
        default:
            lbTemperature.text = "Temperatura"
            btCelsius.setTitle("Celsius", for: .normal)
            btFarenheint.setTitle("Farenheint", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btCelsius {
                btFarenheint.alpha = 0.5
            } else {
                btCelsius.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lbTemperature.text! {
        case "Temperatura":
            calcTemperature()
        case "Peso":
            calcWeight()
        case "Moeda":
            calcCurrency()
        default:
            calcDistance()
        }
        
    }
    
    func calcTemperature() {
        guard let temperature = Double(tfValue.text!) else {return}
        if btCelsius.alpha == 1.0 {
            lbResultUnit.text = "Farenheint"
            lbResult.text = String(temperature * 1.8 + 32.0)
        } else {
            lbResultUnit.text = "Celsius"
            lbResult.text = String(temperature * 32.0 / 1.8)
        }
        lbResultUnit.isHidden = false
    }
    
    func calcWeight() {
        guard let weight = Double(tfValue.text!) else {return}
        if btCelsius.alpha == 1.0 {
            lbResultUnit.text = "Libra"
            lbResult.text = String(weight / 2.2046)
        } else {
            lbResultUnit.text = "Kilograma"
            lbResult.text = String(weight * 2.2046)
        }
        lbResultUnit.isHidden = false
    }
    
    func calcCurrency() {
        guard let currency = Double(tfValue.text!) else {return}
        if btCelsius.alpha == 1.0 {
            lbResultUnit.text = "Dolar"
            lbResult.text = String(currency / 3.5)
        } else {
            lbResultUnit.text = "Real"
            lbResult.text = String(currency * 3.5)
        }
        lbResultUnit.isHidden = false
    }
    
    func calcDistance() {
        guard let distance = Double(tfValue.text!) else {return}
        if btCelsius.alpha == 1.0 {
            lbResultUnit.text = "Kilometro"
            lbResult.text = String(distance / 1000.0)
        } else {
            lbResultUnit.text = "Metros"
            lbResult.text = String(distance * 1000.0)
        }
        lbResultUnit.isHidden = false
    }
    
}

