//
//  XCollectionViewLayout.swift
//  XCollectionView
//
//  Created by shuhei komino on 2018/07/31.
//  Copyright © 2018年 komi2. All rights reserved.
//

import Foundation
import UIKit

public class XCollectionViewLayout {
    
//    func create() -> BaseXCollectionViewLayout {
//        return Type1()
//    }
}

extension XCollectionViewLayout {
    
    public class Type1: BaseXCollectionViewLayout {
        
        var option: XCollectionViewLayoutOption.Type1
        
        public init(option: XCollectionViewLayoutOption.Type1) {
            self.option = option
            super.init()
        }
        
        required public init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override public func prepare() {
            
            guard attributesArray.isEmpty, let collectionView = collectionView else { return }
            var xOffsets = [CGFloat]()
            var yOffsets = [CGFloat]()
            var depth: CGFloat = 0
            
            for item in 0..<collectionView.numberOfItems(inSection: 0) {
                
                let indexPath = IndexPath(item: item, section: 0)
                let padding = option.padding
                var width: CGFloat = contentWidth
                let baseWidth = width
                var height: CGFloat = 0
                
                let a = item % 10
                let b = item % 5
                
                let heightOfBlockB: CGFloat = option.heightOfBlockA / 2
                let raitoOfBlockB: CGFloat = 1 - option.raitoOfBlockA
                
                // Y offset
                let rPos1 = option.reverse ? [1, 7] : [2, 6]
                if rPos1.contains(a) {
                    yOffsets.append(depth + heightOfBlockB)
                }
                else {
                    yOffsets.append(depth)
                }
                
                let rPos2 = option.reverse ? [2, 5] : [0, 7]
                if rPos2.contains(a) {
                    width *= option.raitoOfBlockA
                    height += option.heightOfBlockA
                    if a == (option.reverse ? 2 : 7) {
                        depth += option.heightOfBlockA
                    }
                }
                else if [3, 4].contains(b) {
                    width /= 2
                    height += option.heightOfBlockC
                    if b == 4 {
                        depth += option.heightOfBlockC
                    }
                }
                else {
                    width *= raitoOfBlockB
                    height += heightOfBlockB
                    if a == (option.reverse ? 7 : 2) {
                        depth += option.heightOfBlockA
                    }
                }
                
                
                // X offset
                let rPos3 = option.reverse ? [0, 1, 5] : [0, 5, 6]
                let xOffset = b == 3 || rPos3.contains(a) ? 0 : baseWidth - width
                xOffsets.append(xOffset)
                
                
                let frame = CGRect(x: xOffsets[item], y: yOffsets[item], width: width, height: height)
                let insetFrame = frame.insetBy(dx: padding, dy: padding)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                attributesArray.append(attributes)
                
                contentHeight = max(contentHeight, frame.maxY)
            }
        }
    }
}

extension XCollectionViewLayout {
    
    // Like instagram
    public class Type2: BaseXCollectionViewLayout {
        
        var option: XCollectionViewLayoutOption.Type2
        
        public init(option: XCollectionViewLayoutOption.Type2) {
            self.option = option
            super.init()
        }
        
        required convenience public init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override public func prepare() {
            
            guard attributesArray.isEmpty, let collectionView = collectionView else { return }
            var xOffsets = [CGFloat]()
            var yOffsets = [CGFloat]()
            var depth: CGFloat = 0
            
            for item in 0..<collectionView.numberOfItems(inSection: 0) {
                
                let indexPath = IndexPath(item: item, section: 0)
                let padding = option.padding
                var width: CGFloat = contentWidth
                let baseWidth = width
                var height: CGFloat = 0
                
                let a = item % 18
                let b = item % 9
                
                let SQUARE_A_SIDE: CGFloat = width / 3
                let SQUARE_B_SIDE: CGFloat = width - SQUARE_A_SIDE
                
                // Y offset
                if [1, 11].contains(a) {
                    yOffsets.append(depth + SQUARE_A_SIDE)
                }
                else {
                    yOffsets.append(depth)
                }
                
                if [2, 9].contains(a) {
                    width = SQUARE_B_SIDE
                    height = SQUARE_B_SIDE
                    if a == 2 {
                        depth += SQUARE_B_SIDE
                    }
                }
                else {
                    width = SQUARE_A_SIDE
                    height = SQUARE_A_SIDE
                    if a == 11 {
                        depth += SQUARE_B_SIDE
                    }
                    else if [5, 8].contains(b) {
                        depth += SQUARE_A_SIDE
                    }
                }
                
                // X offset
                if a == 2 {
                    xOffsets.append(baseWidth - SQUARE_B_SIDE)
                }
                else if [4, 7].contains(b) {
                    xOffsets.append(SQUARE_A_SIDE)
                }
                else if [5, 8].contains(b) {
                    xOffsets.append(SQUARE_A_SIDE * 2)
                }
                else if [10, 11].contains(a) {
                    xOffsets.append(baseWidth - SQUARE_A_SIDE)
                }
                else {
                    xOffsets.append(0)
                }
                
                let frame = CGRect(x: xOffsets[item], y: yOffsets[item], width: width, height: height)
                let insetFrame = frame.insetBy(dx: padding, dy: padding)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                attributesArray.append(attributes)
                
                contentHeight = max(contentHeight, frame.maxY)
            }
        }
    }
}

extension XCollectionViewLayout {
    
    public class Type3: BaseXCollectionViewLayout {
        
        var option: XCollectionViewLayoutOption.Type3
        
        public init(option: XCollectionViewLayoutOption.Type3) {
            self.option = option
            super.init()
        }
        
        public required convenience init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override public func prepare() {
            
            guard attributesArray.isEmpty, let collectionView = collectionView else { return }
            var xOffsets = [CGFloat]()
            var yOffsets = [CGFloat]()
            var depth: CGFloat = 0
            
            for item in 0..<collectionView.numberOfItems(inSection: 0) {
                
                let indexPath = IndexPath(item: item, section: 0)
                let padding = option.padding
                let colmun = option.numberOfColumns
                let width = contentWidth / CGFloat(colmun)
                let height = option.heightOfBlock
                
                let a = item % colmun
                
                // Y offset
                yOffsets.append(depth)
                
                if a == colmun - 1 {
                    depth += height
                }
                
                // X offset
                xOffsets.append(CGFloat(a) * width)
                
                let frame = CGRect(x: xOffsets[item], y: yOffsets[item], width: width, height: height)
                let insetFrame = frame.insetBy(dx: padding, dy: padding)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                attributesArray.append(attributes)
                
                contentHeight = max(contentHeight, frame.maxY)
            }
        }
    }
}


public class BaseXCollectionViewLayout: UICollectionViewLayout {
    
    public weak var delegate: XCollectionViewLayoutDelegate!
    
    var attributesArray = [UICollectionViewLayoutAttributes]()
    
    var contentHeight: CGFloat = 0
    
    var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.bounds.width
    }
    
    override public var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in attributesArray {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
}

public protocol XCollectionViewLayoutDelegate: class {
    
}
