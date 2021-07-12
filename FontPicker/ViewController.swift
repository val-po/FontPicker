//
//  ViewController.swift
//  FontPicker
//
//  Created by valentine on 12.07.2021.
//

import UIKit

class ViewController: UIViewController, UIFontPickerViewControllerDelegate {

    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        return label
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Pick Font", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapPickFont), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x: 10,
                             y: view.safeAreaInsets.top,
                             width: view.frame.size.width-20,
                             height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 100
        )
        button.frame = CGRect(x: 20,
                              y: view.frame.size.height-100,
                              width: view.frame.size.width-40,
                              height: 50
        )
    }

    @objc private func didTapPickFont() {
        let config = UIFontPickerViewController.Configuration()
        config.includeFaces = false
        let vc = UIFontPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true, completion: nil)
        guard let descriptor = viewController.selectedFontDescriptor else {
            return
        }
        label.font = UIFont(
            descriptor: descriptor,
            size: 24)
    }
}

