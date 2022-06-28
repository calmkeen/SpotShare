//
//  CellView.swift
//  mySpot
//
//  Created by calmkeen on 2022/06/28.
//

import Foundation
import UIKit

class cellView: UICollectionViewCell{
    static let identifier = "cell"
    }

extension cellView: UICollectionViewDelegateFlowLayout {

    // 위 아래 간격
//    func collectionView(
//        _ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        minimumLineSpacingForSectionAt section: Int
//        ) -> CGFloat {
//        return 5
//    }
//
//    // 옆 간격
//    func collectionView(
//      _ collectionView: UICollectionView,
//      layout collectionViewLayout: UICollectionViewLayout,
//      minimumInteritemSpacingForSectionAt section: Int
//      ) -> CGFloat {
//          return 3
//      }
//
//    // cell 사이즈( 옆 라인을 고려하여 설정 )
//    func collectionView(
//      _ collectionView: UICollectionView,
//      layout collectionViewLayout: UICollectionViewLayout,
//      sizeForItemAt indexPath: IndexPath
//      ) -> CGSize {
//        let width = collectionView.frame.width / 3 - 1
//        let size = CGSize(width: width, height: width)
//        return size
//    }
}

