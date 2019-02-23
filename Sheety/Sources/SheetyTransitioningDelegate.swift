import Foundation
import UIKit

public final class SheetyTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
	
	private var customHeight: CGFloat? = nil
	
	public init(basedOnConfig config: SheetyConfig) {
		self.customHeight = config.contentControllerHeight
		if let height = self.customHeight, config.hasDismissButton {
			self.customHeight = height + CGFloat(80.0)
		}
	}
	
	public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
		let controller = SheetyPresentationController(presentedViewController: presented, presenting: presenting)
		if let height = self.customHeight {
			controller.customHeight = height
		}
		return controller
	}
	
	public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return SheetyPresentingAnimationController()
	}
	
	public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return SheetyDismissingAnimationController()
	}
	
}

