//
//  MainViewController.swift
//  Homework - RGB sliders
//
//  Created by Виталий Сабин on 12.04.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func updateViewBackground(with color: UIColor)
}

final class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandomColor()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = view.backgroundColor
        settingsVC.delegate = self
    }
    
    private func setRandomColor() {
        view.backgroundColor = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1
        )
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func updateViewBackground(with color: UIColor) {
        view.backgroundColor = color
    }
}
