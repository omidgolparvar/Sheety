//
//  SheetyAction.swift
//  Sheety
//
//  Created by Omid Golparvar on 2/23/19.
//  Copyright © 2019 Omid Golparvar. All rights reserved.
//

import Foundation
import UIKit

public final class SheetyAction {
	
	internal var title		: Title
	internal var leftImage	: Image?
	internal var rightImage	: Image?
	internal var handler	: (() -> Void)?
	
	public init(title: Title, leftImage: Image? = nil, rightImage: Image? = nil, handler: (() -> Void)?) {
		self.title		= title
		self.leftImage	= leftImage
		self.rightImage	= rightImage
		self.handler	= handler
	}
	
	
}

public extension SheetyAction {
	
	public struct Image {
		
		var image		: UIImage
		var tintColor	: UIColor?
		
		public init(image: UIImage, tintColor: UIColor? = nil) {
			self.image		= image
			self.tintColor	= tintColor
		}
	}
	
	public struct Title {
		
		public static var DefaultFont	: UIFont = .systemFont(ofSize: 18, weight: .medium)
		
		var text			: String
		var font			: UIFont
		var textColor		: UIColor
		var textAlignment	: NSTextAlignment
		
		public init(text: String, font: UIFont? = nil, textColor: UIColor? = nil, textAlignment: NSTextAlignment = .center) {
			self.text			= text
			self.font			= font ?? Title.DefaultFont
			self.textColor		= textColor ?? UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
			self.textAlignment	= textAlignment
		}
		
	}
	
}
