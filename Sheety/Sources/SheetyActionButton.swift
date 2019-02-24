//
//  SheetyActionButton.swift
//  Sheety
//
//  Created by Omid Golparvar on 2/23/19.
//  Copyright © 2019 Omid Golparvar. All rights reserved.
//

import UIKit

internal class SheetyActionButton: UIButton {
	
	internal typealias Title	= SheetyAction.Title
	internal typealias Image	= SheetyAction.Image
	
	internal static let ImageSize	: CGFloat = 28.0
	
	internal weak var actionController	: SheetyActionController!
	internal var titleItem				: Title!
	internal var leftImage				: Image?
	internal var rightImage				: Image?
	internal var touchUpInsideHandler	: (() -> Void)?
	
	internal var leftImageView			: UIImageView?
	internal var rightImageView			: UIImageView?
	
	internal convenience init(fromAction action: SheetyAction, withActionController actionController: SheetyActionController) {
		self.init(
			title				: action.title,
			leftImage			: action.leftImage,
			rightImage			: action.rightImage,
			actionController	: actionController,
			handler				: action.handler
		)
	}
	
	internal convenience init(
		title				: Title,
		leftImage			: Image? = nil,
		rightImage			: Image? = nil,
		actionController	: SheetyActionController,
		handler				: (() -> Void)?) {
		self.init(frame: .zero)
		
		self.touchUpInsideHandler	= handler
		self.actionController		= actionController
		self.titleItem				= title
		self.leftImage				= leftImage
		self.rightImage				= rightImage
		
		setupView()
		setupTitle()
		setupImages()
		setupHandler()
	}
	
	internal override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	internal required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	internal override func draw(_ rect: CGRect) {
		setupViewsFrames()
		super.draw(rect)
	}
	
	internal override var isHighlighted: Bool {
		get {
			return super.isHighlighted
		}
		
		set {
			self.backgroundColor = newValue ?
				UIColor.white.withAlphaComponent(0.2) :
				UIColor.white.withAlphaComponent(0.4)
			
			self.titleLabel?.alpha = newValue ? 0.3 : 1.0
			self.leftImageView?.alpha = newValue ? 0.3 : 1.0
			self.rightImageView?.alpha = newValue ? 0.3 : 1.0
			
			super.isHighlighted = newValue
		}
	}
	
	private func setupView() {
		self.backgroundColor = UIColor.white.withAlphaComponent(0.4)
		self.titleLabel?.numberOfLines = 2
		self.titleLabel?.textAlignment = titleItem!.textAlignment
	}
	
	private func setupImages() {
		if let leftImage = leftImage {
			let leftImageView = UIImageView(image: leftImage.image)
			leftImageView.contentMode = .scaleAspectFit
			leftImageView.tintColor = leftImage.tintColor ?? titleItem.textColor
			
			let xPos: CGFloat = 16.0
			let yPos: CGFloat = (self.frame.height - SheetyActionButton.ImageSize) / 2.0
			
			leftImageView.frame = CGRect(x: xPos, y: yPos, width: SheetyActionButton.ImageSize, height: SheetyActionButton.ImageSize)
			self.addSubview(leftImageView)
			self.leftImageView = leftImageView
		}
		
		if let rightImage = rightImage {
			let rightImageView = UIImageView(image: rightImage.image)
			rightImageView.contentMode = .scaleAspectFit
			rightImageView.tintColor = rightImage.tintColor ?? titleItem.textColor
			
			let xPos: CGFloat = self.frame.width - 16.0 - SheetyActionButton.ImageSize
			let yPos: CGFloat = (self.frame.height - SheetyActionButton.ImageSize) / 2.0
			
			rightImageView.frame = CGRect(x: xPos, y: yPos, width: SheetyActionButton.ImageSize, height: SheetyActionButton.ImageSize)
			self.addSubview(rightImageView)
			self.rightImageView = rightImageView
		}
	}
	
	private func setupViewsFrames() {
		let size = SheetyActionButton.ImageSize
		let xPos_Left: CGFloat = 16.0
		let yPos_Left: CGFloat = (self.frame.height - size) / 2.0
		leftImageView?.frame = CGRect(x: xPos_Left, y: yPos_Left, width: size, height: size)
		
		let xPos_Right: CGFloat = self.frame.width - 16.0 - size
		let yPos_Right: CGFloat = (self.frame.height - size) / 2.0
		rightImageView?.frame = CGRect(x: xPos_Right, y: yPos_Right, width: size, height: size)
		
		switch titleItem.textAlignment {
		case .left	: self.contentHorizontalAlignment = .left
		case .right	: self.contentHorizontalAlignment = .right
		default		: self.contentHorizontalAlignment = .center
		}
		self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 28 + size, bottom: 0, right: 28 + size)
	}
	
	private func setupTitle() {
		self.titleLabel?.font	= titleItem!.font
		self.setTitle(titleItem.text, for: .normal)
		self.setTitleColor(titleItem.textColor, for: .normal)
	}
	
	private func setupHandler() {
		self.addTarget(self, action: #selector(handler_TouchUpInside), for: .touchUpInside)
	}
	
	@objc
	private func handler_TouchUpInside() {
		let handler = touchUpInsideHandler
		actionController.dismiss(animated: true) {
			handler?()
		}
	}
	
}

