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
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
 
}

