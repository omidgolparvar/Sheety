//
//  SheetyActionController.swift
//  Sheety
//
//  Created by Omid Golparvar on 2/23/19.
//  Copyright © 2019 Omid Golparvar. All rights reserved.
//

import UIKit

public class SheetyActionController: UIViewController {
	
	private var stackView	: UIStackView!
	internal var actions	: [SheetyAction] = []
	
	public init(actions: [SheetyAction]) {
		self.actions = actions
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public override func viewDidLoad() {
        super.viewDidLoad()
		setupStackView()
		setupActionButtons()
    }
	
	private func setupStackView() {
		let stackView = UIStackView(frame: .zero)
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .fillEqually
		stackView.spacing = 1
		self.view.addSubview(stackView)
		stackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: self.view.topAnchor),
			stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
			stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
			stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
			])
		
		self.stackView = stackView
	}
	
	private func setupActionButtons() {
		actions
			.map({ SheetyActionButton(fromAction: $0, withActionController: self) })
			.forEach({ stackView!.addArrangedSubview($0) })
	}
	
}


