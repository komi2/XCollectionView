//
//  ViewController.swift
//  Demo
//
//  Created by shuhei komino on 2018/07/31.
//  Copyright © 2018年 komi2. All rights reserved.
//

import UIKit
import XCollectionView

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let colors: [UIColor] = [
        UIColor(red: 0.976, green: 0.608, blue: 0.231, alpha: 1),
        UIColor(red: 0.988, green: 0.153, blue: 0.635, alpha: 1),
        UIColor(red: 0.988, green: 0.204, blue: 0.333, alpha: 1)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
     
        let option = XCollectionViewLayoutOption.Type1()
        option.reverse = true
        let layout = XCollectionViewLayout.Type1(option: option)
        layout.delegate = self
        collectionView.collectionViewLayout = layout
        
        view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 36
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let c = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        
        c.backgroundColor = colors[indexPath.row % 3]
        return c
    }
}

extension ViewController: XCollectionViewLayoutDelegate {
}


