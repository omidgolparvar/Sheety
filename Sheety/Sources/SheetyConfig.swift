import Foundation
import UIKit

public class SheetyConfig {
	
	public var contentControllerHeight		: CGFloat?
	
	public var hasDismissButton				: Bool
	internal var setupDismissButtonClosure	: ((UIButton) -> Void)?
	
	public var contentBlurStyle				: UIBlurEffect.Style?
	
	public init(contentControllerHeight	: CGFloat? = nil) {
		self.contentControllerHeight	= contentControllerHeight
		self.hasDismissButton			= true
		self.setupDismissButtonClosure	= nil
		self.contentBlurStyle			= nil
	}
	
	public func setupDismissButton(_ closure: @escaping (UIButton) -> Void) {
		self.setupDismissButtonClosure = closure
	}
	
}
