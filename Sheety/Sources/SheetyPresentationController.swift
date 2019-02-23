import Foundation
import UIKit


class SheetyPresentationController: UIPresentationController {
	
	var customHeight: CGFloat? = nil
	
	private let backgroundView: UIView = UIView()
	
	override var frameOfPresentedViewInContainerView: CGRect {
		guard let containerView = containerView else { return .zero }
		
		var customHeight = self.customHeight ?? containerView.bounds.height
		if customHeight > containerView.bounds.height {
			customHeight = containerView.bounds.height
			print("Sheety: Custom height change to default value. Your height more maximum value")
		}
		
		let yOffset: CGFloat = containerView.bounds.height - customHeight
		return CGRect(x: 0, y: yOffset, width: containerView.bounds.width, height: containerView.bounds.height - yOffset)
	}
	
	override func presentationTransitionWillBegin() {
		super.presentationTransitionWillBegin()
		
		guard
			let containerView = self.containerView,
			let window = containerView.window
			else { return }
		
		self.backgroundView.alpha = 0
		self.backgroundView.frame = .zero
		self.backgroundView.backgroundColor = .black
		self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
		
		containerView.insertSubview(self.backgroundView, belowSubview: presentedViewController.view)
		
		NSLayoutConstraint.activate([
			self.backgroundView.topAnchor.constraint(equalTo: window.topAnchor),
			self.backgroundView.leftAnchor.constraint(equalTo: window.leftAnchor),
			self.backgroundView.rightAnchor.constraint(equalTo: window.rightAnchor),
			self.backgroundView.bottomAnchor.constraint(equalTo: window.bottomAnchor)
			])
		
		presentedViewController.transitionCoordinator?.animate(
			alongsideTransition: { [weak self] context in
				self?.backgroundView.alpha = 0.5
			},
			completion: nil
		)
	}
	
	override func presentationTransitionDidEnd(_ completed: Bool) {
		super.presentationTransitionDidEnd(completed)
		
		self.presentedViewController.view.frame = self.frameOfPresentedViewInContainerView
		
		let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.dismissAction))
		tap.cancelsTouchesInView = false
		self.backgroundView.addGestureRecognizer(tap)
	}
	
	override func dismissalTransitionWillBegin() {
		super.dismissalTransitionWillBegin()
		presentedViewController.transitionCoordinator?.animate(
			alongsideTransition: { [weak self] context in
				guard let `self` = self else { return }
				self.backgroundView.alpha = 0
			},
			completion: { _ in
				
			}
		)
	}
	
	override func containerViewWillLayoutSubviews() {
		super.containerViewWillLayoutSubviews()
		
		guard let containerView = containerView else { return }
		
		if presentedViewController.view.isDescendant(of: containerView) {
			UIView.animate(withDuration: 0.1) { [weak self] in
				guard let `self` = self else { return }
				self.presentedViewController.view.frame = self.frameOfPresentedViewInContainerView
			}
		}
	}
	
	@objc
	private func dismissAction() {
		self.presentingViewController.view.endEditing(true)
		self.presentedViewController.view.endEditing(true)
		self.presentedViewController.dismiss(animated: true, completion: nil)
	}
	
	
}
