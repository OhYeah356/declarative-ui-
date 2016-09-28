//
//  CollectionViewCell.swift
//  DeclarativeUI
//
//  Created by Jan Vrzal on 26.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import UIKit

class HeaderCell: UICollectionViewCell {

	let headerLabel: UILabel = {
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

	func setCell(){
		addSubview(headerLabel)
		backgroundColor = .whiteColor()
	}
}
