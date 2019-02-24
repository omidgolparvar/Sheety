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
		config.setupDismissButton { (button) in
			button.titleLabel?.font = UIFont(name: "Menlo", size: 18)
			button.setTitle("Back", for: .normal)
		}
		let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController")
		self.presentAsSheety(controller, using: config, complection: nil)
	}
	
	@IBAction func actionPresentSheetyActionController(_ sender: UIButton) {
		let image1 = UIImage(named: "Image1")!
		let image2 = UIImage(named: "Image2")!
		
		let action0 = SheetyAction(
			title		: .init(text: "گزینه اول", textAlignment: .right),
			leftImage	: nil,
			rightImage	: .init(image: image1)) {
			print("Option One Selected.")
		}
		
		let action1 = SheetyAction(
			title		: .init(text: "Option Two", textAlignment: .left),
			leftImage	: .init(image: image2),
			rightImage	: nil) {
				print("Option Two Selected.")
		}
		
		let action2 = SheetyAction(
			title		: .init(text: "Third", textColor: .red),
			leftImage	: .init(image: image2),
			rightImage	: .init(image: image1)) { [unowned self] in
				print("Option Three Selected.")
				let a1 = UIAlertAction(title: "One", style: .default, handler: nil)
				let a2 = UIAlertAction(title: "One", style: .default, handler: nil)
				let a3 = UIAlertAction(title: "One", style: .cancel, handler: nil)
				let a = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
				a.addAction(a1)
				a.addAction(a2)
				a.addAction(a3)
				self.present(a, animated: true, completion: nil)
		}
		
		
		self.presentSheetyActionController(with: [action0, action1, action2])
	}
	
}

