//
//  ButtonCell.swift
//  DeclarativeUI
//
//  Created by Jan Vrzal on 27.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import UIKit

class ButtonCell: UICollectionViewCell {

	let button: UIButton = {
		let button = UIButton(frame: CGRect(x: 5, y: 20, width: 230, height: 20))
		button.contentHorizontalAlignment = .Left
		button.setTitleColor(.greenColor(), forState: .Normal)
		button.setTitleColor(.grayColor(), forState: .Highlighted)
		return button
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setCell()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setCell() {
		addSubview(button)
		backgroundColor = .whiteColor()
	}
}
