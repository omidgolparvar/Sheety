import Foundation
import UIKit

final class SheetyDismissingAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		guard let presentedViewController = transitionContext.viewController(forKey: .from) else { return }
		
		let containerView = transitionContext.containerView
		let offscreenFrame = CGRect(x: 0, y: containerView.bounds.height, width: containerView.bounds.width, height: containerView.bounds.height)
		
		UIView.animate(
			withDuration: transitionDuration(using: transitionContext),
			delay: 0,
			usingSpringWithDamping: 1,
			initialSpringVelocity: 1,
			options: .curveEaseIn,
			animations: {
				presentedViewController.view.frame = offscreenFrame
		}) { finished in
			transitionContext.completeTransition(finished)
		}
	}
	
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return 0.6
	}
}
