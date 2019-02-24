//
//  SheetyViewControllerExtensions.swift
//  Testa
//
//  Created by Omid Golparvar on 2/22/19.
//  Copyright © 2019 Omid Golparvar. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
	
	public func presentAsSheety(_ controller: UIViewController, using config: SheetyConfig = .init(), complection: (() -> Void)? = nil) {
		let mainController = SheetyController.Initialize(for: controller, with: config)
		let transitionDelegate = SheetyTransitioningDelegate(basedOnConfig: config)
		mainController.transitioningDelegate = transitionDelegate
		mainController.modalPresentationStyle = .custom
		mainController.modalPresentationCapturesStatusBarAppearance = true
		self.present(mainController, animated: true, completion: complection)
	}
	
	public func presentSheetyActionController(with actions: [SheetyAction], complection: (() -> Void)? = nil) {
		let sheetyActionController = SheetyActionController(actions: actions)
		let height = CGFloat(actions.count * 56) + CGFloat(actions.count - 1)
		let config = SheetyConfig(contentControllerHeight: height)
		config.contentBlurStyle = .light
		self.presentAsSheety(sheetyActionController, using: config, complection: complection)
	}
	
	public func dismissSheety(animated: Bool = true, completion: (() -> Void)?) {
		guard let sheetyController = self.parent as? SheetyController else { return }
		sheetyController.dismiss(animated: animated, completion: completion)
	}
}
