//
//  ViewController.swift
//  TextFieldKeyboard
//
//  Created by 김종권 on 2021/09/06.
//

import UIKit

class ViewController: UIViewController {

    lazy var textField: UITextField = {
        let view = UITextField()
        view.inputAccessoryView = accessoryView // <-
        view.placeholder = "입력 창"
        view.textAlignment = .center

        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor

        return view
    }()

    lazy var accessoryView: UIView = {
        return UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 72.0))
    }()

    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("확인", for: .normal)
        button.backgroundColor = .systemBlue.withAlphaComponent(0.7)

        button.layer.cornerRadius = 14.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.systemGray.cgColor

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addTapGesture()
        addSubviews()
        makeConstraints()
    }

    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:)))
        view.addGestureRecognizer(tapGesture)
    }

    @objc
    private func hideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }

    private func addSubviews() {
        view.addSubview(textField)
        accessoryView.addSubview(confirmButton)
    }

    private func makeConstraints() {

        guard let confirmButtonSuperview = confirmButton.superview else { return }

        textField.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 56),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -56),
            textField.heightAnchor.constraint(equalToConstant: 60),

            confirmButton.leadingAnchor.constraint(equalTo: confirmButtonSuperview.leadingAnchor, constant: 16),
            confirmButton.trailingAnchor.constraint(equalTo: confirmButtonSuperview.trailingAnchor, constant: -16),
            confirmButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
