//
//  ViewController.swift
//  TestTextField
//
//  Created by 순진이 on 2021/12/29.
//

import UIKit

class ViewController: UIViewController {

    let label = UILabel()
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
        label.text = "Sample Text"

        button.setTitle("Present", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
    }

    private func setContraints() {
        [label, button].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -30)
        ])
    }

    // MARK: - Selectors
    @objc
    private func handleButton(_ sender: UIButton) {
        let nextVC = SecondViewController()
        nextVC.delegate = self
        self.present(nextVC, animated: true, completion: nil)
    }
}

extension ViewController: CustomTextFieldDelegate {
    func textDidInput(didInput text: String) {
        label.text = text
    }
}
