//
//  ViewController.swift
//  DeclarativeUI
//
//  Created by Jan Vrzal on 26.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let data = DataHandler()

	let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // Layout for collectionView
	let layout: UICollectionViewFlowLayout = {
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsetsMake(20, 20, 200, 20)
		layout.estimatedItemSize = CGSize(width: 280, height: 61)

		return layout
	}()
    
	override func viewDidLoad() {
		super.viewDidLoad()
        
		setCollectionView()
		data.getJSONData()
        setView()
	}
   
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// Collection View
	func setCollectionView() {
		view.addSubview(collectionView)

		collectionView.frame = self.view.frame
		collectionView.collectionViewLayout = layout
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.backgroundColor = .lightGrayColor()
		collectionView.registerClass(HeaderCell.self, forCellWithReuseIdentifier: "HeaderCell")
		collectionView.registerClass(ButtonCell.self, forCellWithReuseIdentifier: "ButtonCell")
		collectionView.registerClass(SingleLabelCell.self, forCellWithReuseIdentifier: "LabelCell")
	}
    
    // Set View
    func setView(){
        title = data.mainTitle
    }
    
	// MARK: - CollectionView Data Source

	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return data.components.count
	}

	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let JSONdata = data.components
		for i in JSONdata {
			if i.indexPath == indexPath.row {
                // Return cell by type name
                return getCell(i.type, indexPath: indexPath, text: i.text)
			}
		}
        // Return Default cell
        return UICollectionViewCell()
	}

    
    // Return cell by type
    func getCell(cellName: String, indexPath: NSIndexPath, text: String) -> UICollectionViewCell {
        
        // Header Cell
		if cellName == ComponentsType.Header.rawValue {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HeaderCell", forIndexPath: indexPath) as! HeaderCell
            cell.headerLabel.text = text
            return cell
        // Button Cell
		} else if cellName == ComponentsType.SingleButton.rawValue {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ButtonCell", forIndexPath: indexPath) as! ButtonCell
            cell.button.setTitle(text, forState: .Normal)
			return cell
        // Label Cell
		} else if cellName == ComponentsType.SingleLabel.rawValue {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LabelCell", forIndexPath: indexPath) as! SingleLabelCell
            cell.label.text = text
			return cell
		} else {
        // Default
			return UICollectionViewCell()
		}
	}

}





