import UIKit

final class SheetyController: UIViewController {
	
	public static func Initialize(for controller: UIViewController, with config: SheetyConfig) -> SheetyController {
		let bundle			= Bundle(for: SheetyController.self)
		let storyboard		= UIStoryboard(name: "Main", bundle: bundle)
		let mainController	= storyboard.instantiateViewController(withIdentifier: "SheetyController") as! SheetyController
		mainController.config = config
		mainController.controller = controller
		return mainController
	}
	
	@IBOutlet weak var button_Dismiss		: UIButton!
	@IBOutlet weak var view_ContentHolder	: UIView!
	
	var controller: UIViewController!
	var config: SheetyConfig!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupViews()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
	}
	@IBAction func action_Dismiss(_ sender: UIButton) {
		dismiss(animated: true, completion: nil)
	}
	
}

extension SheetyController {
	
	private func setupViews() {
		self.view.backgroundColor = .clear
		
		if config.hasDismissButton {
			button_Dismiss.layer.cornerRadius = 12.0
			button_Dismiss.clipsToBounds = true
			if let closure = config.setupDismissButtonClosure {
				closure(button_Dismiss)
			}
		} else {
			button_Dismiss.removeFromSuperview()
		}
		
		view_ContentHolder.layer.cornerRadius = 12.0
		view_ContentHolder.clipsToBounds = true
		
		if let blurStyle = config.contentBlurStyle {
			let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
			view_ContentHolder.backgroundColor = UIColor.white.withAlphaComponent(0.4)
			view_ContentHolder.addSubview(visualEffectView)
			visualEffectView.translatesAutoresizingMaskIntoConstraints = false
			visualEffectView.topAnchor.constraint(equalTo: view_ContentHolder.topAnchor, constant: 0).isActive = true
			visualEffectView.rightAnchor.constraint(equalTo: view_ContentHolder.rightAnchor, constant: 0).isActive = true
			visualEffectView.leftAnchor.constraint(equalTo: view_ContentHolder.leftAnchor, constant: 0).isActive = true
			visualEffectView.bottomAnchor.constraint(equalTo: view_ContentHolder.bottomAnchor, constant: 0).isActive = true
		}
		
		setupViews_EmbeddedController()
	}
	
	private func setupViews_EmbeddedController() {
		self.addChild(controller)
		self.view_ContentHolder.addSubview(controller.view)
		
		controller.view.translatesAutoresizingMaskIntoConstraints = false
		controller.view.topAnchor.constraint(equalTo: view_ContentHolder.topAnchor, constant: 0).isActive = true
		controller.view.rightAnchor.constraint(equalTo: view_ContentHolder.rightAnchor, constant: 0).isActive = true
		controller.view.leftAnchor.constraint(equalTo: view_ContentHolder.leftAnchor, constant: 0).isActive = true
		controller.view.bottomAnchor.constraint(equalTo: view_ContentHolder.bottomAnchor, constant: 0).isActive = true
		
		controller.didMove(toParent: self)
	}
	
}

