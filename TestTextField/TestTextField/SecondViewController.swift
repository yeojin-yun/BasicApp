//
//  SecondViewController.swift
//  TestTextField
//
//  Created by 순진이 on 2021/12/30.
//

import UIKit

protocol CustomTextFieldDelegate: class {
    func textDidInput(didInput text: String)
}

class SecondViewController: UIViewController {

    weak var delegate: CustomTextFieldDelegate?

    let textField = UITextField()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        setAttributes()
        setContraints()
    }

    private func setAttributes() {
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5

        button.setTitle("Dismiss", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
    }

    private func setContraints() {
        [textField, button].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 350),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -30)
        ])
    }

    // MARK: - Selectors
    @objc
    private func handleButton(_ sender: UIButton) {
        let text = textField.text ?? ""
        self.delegate?.textDidInput(didInput: text)
        self.dismiss(animated: true, completion: nil)
    }
}
