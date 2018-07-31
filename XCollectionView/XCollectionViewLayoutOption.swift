//
//  XCollectionViewLayoutOption.swift
//  XCollectionView
//
//  Created by shuhei komino on 2018/07/31.
//  Copyright © 2018年 komi2. All rights reserved.
//

import Foundation
import UIKit

public class XCollectionViewLayoutOption {}

extension XCollectionViewLayoutOption {
    
    public class Type1: BaseXCollectionViewLayoutOption {
        
        public var heightOfBlockA: CGFloat = 340
        
        public var heightOfBlockC: CGFloat = 300
        
        public var raitoOfBlockA: CGFloat = 0.65
        
//        public override init() {}
    }
}

extension XCollectionViewLayoutOption {
    
    public class Type2: BaseXCollectionViewLayoutOption {
        
//        public override init() {}
    }
}

extension XCollectionViewLayoutOption {
    
    public class Type3: BaseXCollectionViewLayoutOption {
        
        public var numberOfColumns: Int = 2
        
        public var heightOfBlock: CGFloat = 300
        
//        public override init() {}
    }
}

public class BaseXCollectionViewLayoutOption {
    
    public var padding: CGFloat = 2
    
    public var reverse = false
    
    public init() {}
}
