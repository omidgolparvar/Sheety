import Foundation
import UIKit

public final class SheetyTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
	
	private var customHeight: CGFloat? = nil
	
	public init(basedOnConfig config: SheetyConfig) {
		self.customHeight = config.contentControllerHeight
		if var height = self.customHeight, config.hasDismissButton {
			let extraForDismissButton: CGFloat = 80.0
			height += extraForDismissButton
			if	#available(iOS 11.0, *),
				let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom,
				bottomPadding > 24 {
				height += bottomPadding
			}
			self.customHeight = height + 10
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

