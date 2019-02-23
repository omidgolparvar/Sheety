//
//  ActionsController.swift
//  Example
//
//  Created by Omid Golparvar on 2/23/19.
//  Copyright © 2019 Omid Golparvar. All rights reserved.
//

import UIKit

class ActionsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func action1(_ sender: UIButton) {
		print(#function)
	}
	
	@IBAction func action2(_ sender: UIButton) {
		print(#function)
	}
	
	@IBAction func actionDismiss(_ sender: UIButton) {
		self.dismissSheety(animated: true) {
			print("Dismiss Done.")
		}
	}

}
