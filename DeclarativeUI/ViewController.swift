//
//  ViewController.swift
//  DeclarativeUI
//
//  Created by Jan Vrzal on 26.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
	let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let sectionData = SectionData()
    let cellCreator = CellCreator()
    
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
	}
    
    // Set View
    func setView(){
        title = sectionData.getTitle()
    }
    
	// MARK: - CollectionView Data Source
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return sectionData.getComponents().count
	}

	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let data = sectionData.getComponents()
		for (i,y) in data.enumerate() {
			if i == indexPath.row {
                // Return cell by type name
                return cellCreator.createCell(y.type, indexPath: indexPath, text: y.text, collectionView: self.collectionView)
			}
		}
        return UICollectionViewCell()
	}

}





