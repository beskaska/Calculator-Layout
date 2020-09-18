//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	private var brain = CalculatorBrain()
	@IBOutlet weak var displayLabel: UILabel!
	@IBOutlet weak var clearButtonLabel: UIButton!
	private var typingIsFinished = true
	private var displayValue: Double {
		get {
			guard let number = Double(displayLabel.text!) else {
				fatalError("Cannot convert displayLabel text to a Double.")
			}
			return number
		}
		set {
			if floor(newValue) == newValue {
				displayLabel.text = String(Int(newValue))
			} else {
				displayLabel.text = String(newValue)
			}
		}
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

	@IBAction func calcButtonPressed(_ sender: UIButton) {
		
		guard let calcMethod = sender.currentTitle else {
			fatalError("There is a button without label text.")
		}
		
		typingIsFinished = true
		brain.setNumber(displayValue)
		displayValue = brain.calculate(symbol: calcMethod)
	}
	
	@IBAction func numberButtonPressed(_ sender: UIButton) {

		guard let btnValue = sender.currentTitle else {
			fatalError("There is a button without label text.")
		}
		
		if typingIsFinished {
			if btnValue == "." {
				displayLabel.text = "0."
			} else {
				displayLabel.text = btnValue
			}
			typingIsFinished = false
		} else if btnValue != "." || !displayLabel.text!.contains(".") {
			displayLabel.text! += btnValue
		}
	}
}

