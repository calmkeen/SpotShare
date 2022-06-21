//
//  albumView.swift
//  SpotShare
//
//  Created by calmkeen on 2022/06/15.
//

import Foundation
import UIKit
import SnapKit

class albumCategoryView: UIViewController{
    
    let albumcell = ablumCell()
    
    let mainView: UIView = {
        let mainView = UIView()
        mainView.backgroundColor = .white
        return mainView
    }()
    let collectionView: UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
        collectionView.minimumLineSpacing = 10
         
        collectionView.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionView)
        return cv
    }()
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "나만의 앨범"
        return title
    }()
    let tagCategory: UILabel = {
        let tag = UILabel()
        tag.text = "Tag별 앨범"
        return tag
    }()
    
    
    func albumViewSetUp(){
        view.addSubview(collectionView)
        collectionView.addSubview(mainView)
        collectionView.addSubview(titleLabel)
        collectionView.addSubview(tagCategory)
        
        
        

        collectionView.snp.makeConstraints{make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        mainView.snp.makeConstraints{make in
            make.edges.equalTo(collectionView)
        }
        titleLabel.snp.makeConstraints{make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(10)
        }
        tagCategory.snp.makeConstraints{make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
        }
    }
}

    extension albumCategoryView: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
        
    }
