//
//  SingleLabelCell.swift
//  DeclarativeUI
//
//  Created by Jan Vrzal on 27.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import UIKit

class SingleLabelCell: UICollectionViewCell {

	let label: UILabel = {
		let label = UILabel(frame: CGRect(x: 5, y: 20, width: 230, height: 20))
		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setCell()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setCell() {
		addSubview(label)
		backgroundColor = .whiteColor()
	}
}
