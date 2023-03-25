//
//  ViewController.swift
//  imc
//
//  Created by Jadiê on 22/03/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorScreen: CalculatorScreen?
    
    override func loadView() {
        self.calculatorScreen = CalculatorScreen()
        self.view = self.calculatorScreen
        self.calculatorScreen?.configTextFieldDelegate(delegate: self)
        self.calculatorScreen?.delegate(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
}

extension CalculatorViewController:UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.calculatorScreen?.validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension CalculatorViewController:CalculatorScreenProtocol {
    func actionCalculateButton() {
        
        if let weight = Double((self.calculatorScreen?.weightInput.text)!), let height = Double((self.calculatorScreen?.heigthInput.text)!) {
            
            var imc: Double = 0
            imc = weight / (height*height)
            
            var result: String = ""
            var image: String = ""
            switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
                
            }
            self.calculatorScreen?.textLabel.text = "Seu índice de massa corporal é"
            self.calculatorScreen?.resultLabel.text = "\(Int(imc)): \(result) "
            self.calculatorScreen?.resultImage.image = UIImage(named: image)
        }
    }
    
    
}

