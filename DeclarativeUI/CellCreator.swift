//
//  CellCreator.swift
//  DeclarativeUI
//
//  Created by Jan Vrzal on 02.10.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import UIKit

class CellCreator: CellCreatorProtocol {

	// Return cell by type
	func createCell(cellName: String, indexPath: NSIndexPath, text: String, collectionView: UICollectionView) -> UICollectionViewCell {

		// Header Cell
		if cellName == "header" {
			collectionView.registerClass(HeaderCell.self, forCellWithReuseIdentifier: cellName)
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellName, forIndexPath: indexPath) as! HeaderCell
			cell.headerLabel.text = text
			return cell
			// Button Cell
		} else if cellName == "single-button" {
			collectionView.registerClass(ButtonCell.self, forCellWithReuseIdentifier: cellName)
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellName, forIndexPath: indexPath) as! ButtonCell
			cell.button.setTitle(text, forState: .Normal)
			return cell
			// Label Cell
		} else if cellName == "single-label" {
			collectionView.registerClass(SingleLabelCell.self, forCellWithReuseIdentifier: cellName)
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellName, forIndexPath: indexPath) as! SingleLabelCell
			cell.label.text = text
			return cell
		} else {
			// Default
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellName, forIndexPath: indexPath) as! SingleLabelCell
			cell.label.text = text
			return cell
		}
	}
}

protocol CellCreatorProtocol {
    func createCell(cellName: String, indexPath: NSIndexPath, text: String, collectionView: UICollectionView) -> UICollectionViewCell
}