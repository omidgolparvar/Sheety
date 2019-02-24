//
//  CollectionViewController.swift
//  Example
//
//  Created by Omid Golparvar on 2/24/19.
//  Copyright © 2019 Omid Golparvar. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
		
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
	
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
	
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
		cell.backgroundColor = .red
		cell.layer.cornerRadius = 8.0
		cell.clipsToBounds = true
        return cell
    }
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath)!
		let label = UILabel(frame: .init(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
		label.text = "OK"
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
		label.textAlignment = .center
		cell.backgroundColor = .blue
		cell.contentView.addSubview(label)
		collectionView.isUserInteractionEnabled = false
		collectionView.isScrollEnabled = false
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
			self?.dismissSheety(animated: true, completion: nil)
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let heightOfCollectionView = collectionView.frame.height
		let paddings: CGFloat = 20.0
		return CGSize(width: heightOfCollectionView - paddings, height: heightOfCollectionView - paddings)
	}
	
}
