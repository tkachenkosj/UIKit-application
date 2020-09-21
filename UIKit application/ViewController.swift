//
//  ViewController.swift
//  UIKit application
//
//  Created by Сергей Ткаченко on 20.09.2020.
//  Copyright © 2020 Sergey Tkachenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segmentSwitcher: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var sliderControl: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var setButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Label
        mainLabel.text = ""
        mainLabel.textAlignment = .center
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.numberOfLines = 2
        
        // Setup Segment Control
        segmentSwitcher.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Setup Slider
        sliderControl.minimumValue = 0
        sliderControl.maximumValue = 1
        sliderControl.value = 0.5
        sliderControl.maximumTrackTintColor = .red
        
    
    }

    @IBAction func changeSegment() {
        switch segmentSwitcher.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .green
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .blue
        default:
            break
        }
    }
    
    @IBAction func moveTheSlider() {
        let backgroundColor = view.backgroundColor
        view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sliderControl.value))
        mainLabel.textColor = .white
        mainLabel.text = String(sliderControl.value)
    }
    
    @IBAction func setText() {
        guard let inputText = textField.text, !inputText.isEmpty else { return }
        
        if let _ = Double(inputText) {
            print("Wrong format")
            showAlert(title: "Wrong format!", message: "Please, enter your name")
        } else {
            mainLabel.text = inputText
            textField.text = nil
        }
    }
    
}

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        present(alert, animated: true)
    }
}
