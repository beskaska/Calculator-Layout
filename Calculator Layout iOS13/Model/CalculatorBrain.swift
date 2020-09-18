//
//  CalculatorBrain.swift
//  Calculator Layout iOS13
//
//  Created by Athena Imelda on 9/16/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
	
	private var number: Double?
	private var intermediateCalculation: (firstArgument: Double, calcMethod: String)?
	
	mutating func setNumber(_ number: Double) {
		self.number = number
	}
	
	mutating func calculate(symbol: String) -> Double {
		
		guard let n = number else {
			fatalError("Cannot convert displayLabel text to a Double.")
		}
		
		switch symbol {
		case "+/-":
			return -n
		case "AC":
			return 0
		case "%":
			return n * 0.01
		case "=":
			return performCalculation(n2: n)
		default:
			intermediateCalculation = (n, symbol)
			return n
		}
	}
	
	private mutating func performCalculation(n2: Double) -> Double {
		guard let n1 = intermediateCalculation?.firstArgument, let calcMethod = intermediateCalculation?.calcMethod else {
			return n2
		}
		switch calcMethod {
		case "+":
			return n1 + n2
		case "-":
			return n1 - n2
		case "×":
			return n1 * n2
		case "÷":
			return n1 / n2
		default:
			fatalError("Undefined calcButton.")
		}
	}
}
