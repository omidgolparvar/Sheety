//
//  ViewController.swift
//  Example
//
//  Created by Omid Golparvar on 2/23/19.
//  Copyright © 2019 Omid Golparvar. All rights reserved.
//

import UIKit
import Sheety

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func actionPresentSheety(_ sender: UIButton) {
		let config = SheetyConfig(contentControllerHeight: 180)
		config.contentBlurStyle = .extraLight
		config.setupDismissButton { (button) in
			button.titleLabel?.font = UIFont(name: "Menlo", size: 18)
			button.setTitle("Back", for: .normal)
		}
		let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ActionsController")
		self.presentAsSheety(controller, using: config, complection: nil)
	}


}

