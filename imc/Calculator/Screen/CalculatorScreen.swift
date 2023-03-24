//
//  CalculatorScreen.swift
//  imc
//
//  Created by Jadiê on 24/03/23.
//

import UIKit
protocol CalculatorScreenProtocol:class {
    func actionCalculateButton()
}

class CalculatorScreen: UIView {
    
    private weak var delegate:CalculatorScreenProtocol?
    
    func delegate(delegate: CalculatorScreenProtocol) {
        self.delegate = delegate
    }
    
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
        subtitle.font = UIFont.systemFont(ofSize: 16)
        return subtitle
    }()
    
    lazy var weightLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Peso (Kg)"
        lb.textColor = .white
        lb.font = UIFont.systemFont(ofSize: 16)
        return lb
    }()
    
    lazy var heightLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Altura(m)"
        lb.textColor = .white
        lb.font = UIFont.systemFont(ofSize: 16)
        return lb
    }()
    
    
    
    lazy var textLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 24)
        return title
    }()
    
    lazy var resultLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 24)
        return title
    }()
    
    lazy var weightInput: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
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
        tf.keyboardType = .default
        tf.placeholder = "Ex: 1.70"
        tf.textColor = .gray
        return tf
    }()
    
    lazy var calculateButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Calcular", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 7.5
        btn.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0)
        btn.addTarget(self, action: #selector(self.tappedCalculate), for: .touchUpInside)
        return btn
    }()
    
    lazy var resultImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 153/255, green: 153/255, blue: 255/255, alpha: 1.0)
       
        self.configSuperView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTextFieldDelegate(delegate:UITextFieldDelegate) {
        self.heigthInput.delegate = delegate
        self.weightInput.delegate = delegate
    }
//
    @objc private func tappedCalculate(){
        
        self.delegate?.actionCalculateButton()
    }
    
    private func configSuperView() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.subTitleLabel)
        self.addSubview(self.weightInput)
        self.addSubview(self.heigthInput)
        self.addSubview(self.calculateButton)
        self.addSubview(self.textLabel)
        self.addSubview(self.resultLabel)
        self.addSubview(self.resultImage)
        self.addSubview(self.weightLabel)
        self.addSubview(self.heightLabel)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            self.subTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            
            self.weightLabel.topAnchor.constraint(equalTo: self.subTitleLabel.bottomAnchor, constant: 20),
            self.weightLabel.centerXAnchor.constraint(equalTo: self.weightInput.centerXAnchor),
            
            self.heightLabel.topAnchor.constraint(equalTo: self.subTitleLabel.bottomAnchor, constant: 20),
            self.heightLabel.centerXAnchor.constraint(equalTo: self.heigthInput.centerXAnchor),
            
            self.weightInput.topAnchor.constraint(equalTo: self.weightLabel.bottomAnchor, constant: 10),
            self.weightInput.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.weightInput.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -220),
            self.weightInput.heightAnchor.constraint(equalToConstant: 40),
            
            self.heigthInput.topAnchor.constraint(equalTo: self.heightLabel.bottomAnchor, constant: 10),
            self.heigthInput.leadingAnchor.constraint(equalTo: self.weightInput.trailingAnchor, constant: 40),
            self.heigthInput.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.heigthInput.heightAnchor.constraint(equalTo: self.weightInput.heightAnchor),
            
            self.calculateButton.topAnchor.constraint(equalTo: self.heigthInput.bottomAnchor,constant: 30),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.calculateButton.heightAnchor.constraint(equalTo: self.weightInput.heightAnchor),
            
            self.textLabel.topAnchor.constraint(equalTo: self.calculateButton.bottomAnchor, constant: 20),
            self.textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.resultLabel.topAnchor.constraint(equalTo: self.textLabel.bottomAnchor, constant: 20),
            self.resultLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.resultImage.topAnchor.constraint(equalTo: self.resultLabel .bottomAnchor, constant: 30),
            self.resultImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }
    
}




