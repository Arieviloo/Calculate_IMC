//
//  ViewController.swift
//  imc
//
//  Created by Jadiê on 22/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Cálculo IMC"
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 24)
        return title
    }()
    
    lazy var subTitleLabel: UILabel = {
        let subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.text = "Descubra o seu índice de massa corporal"
        subtitle.textColor = .white
        subtitle.font = UIFont.systemFont(ofSize: 14)
        return subtitle
    }()
    
    lazy var weightInput: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Ex: 80"
        tf.textColor = .gray
        return tf
    }()
    
    lazy var heigthInput: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Ex: 170"
        tf.textColor = .gray
        return tf
    }()
    
    lazy var calculateButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Logar", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 7.5
        btn.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        btn.addTarget(self, action: #selector(self.tappedCalculate), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.subTitleLabel)
        self.view.addSubview(self.weightInput)
        self.view.addSubview(self.heigthInput)
        self.view.addSubview(self.calculateButton)
        self.setUpConstraints()
    }
    
    @objc func tappedCalculate(){
        let valueWeight = Double(weightInput.text!)
        let valueHeight = Double(heigthInput.text!)
        print(valueHeight)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            
            self.subTitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            
            self.weightInput.topAnchor.constraint(equalTo: self.subTitleLabel.bottomAnchor, constant: 40),
            self.weightInput.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.weightInput.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -220),
            self.weightInput.heightAnchor.constraint(equalToConstant: 40),
            
            self.heigthInput.topAnchor.constraint(equalTo: self.subTitleLabel.bottomAnchor, constant: 40),
            self.heigthInput.leadingAnchor.constraint(equalTo: self.weightInput.trailingAnchor, constant: 40),
            self.heigthInput.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.heigthInput.heightAnchor.constraint(equalTo: self.weightInput.heightAnchor),
            
            self.calculateButton.topAnchor.constraint(equalTo: self.heigthInput.bottomAnchor,constant: 30),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.calculateButton.heightAnchor.constraint(equalTo: self.weightInput.heightAnchor)
            
            
        
        ])
    }
    
    


}

