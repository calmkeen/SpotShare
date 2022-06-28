//
//  listVIew.swift
//  mySpot
//
//  Created by calmkeen on 2022/06/17.
//

import Foundation
import UIKit
import SnapKit

class ListCateView: UIViewController{
    let cellview = cellView()
    
    let cView: UICollectionView = {
        let cView = UICollectionViewFlowLayout()
        cView.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: cView)
        cv.register(cellView.self, forCellWithReuseIdentifier: cellView.identifier)
        cv.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeListView()
        makeView()
        configureCollectionView()
        print("listView")
    }
    func configureCollectionView() {
        cView.register(ListCateView.self, forCellWithReuseIdentifier: "cell")
        cView.delegate = self
        cView.dataSource = self
    }
    
    let listviewStack: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "listView"
        return label
    }()
    
    func makeListView(){
        view.backgroundColor = .gray
        //view.addSubview(listviewStack)
        listviewStack.addSubview(label)
        view.addSubview(cView)
    }

}


extension ListCateView:
     UICollectionViewDelegate,
     UICollectionViewDataSource,
     UICollectionViewDelegateFlowLayout{
     
    // 컬렉션 뷰의 아이템이 몇개인지???
          func collectionView(
              _ collectionView: UICollectionView,
              numberOfItemsInSection section: Int
          ) -> Int {
              return 7
          }
          
         // 컬렉션 뷰의 하나의 단위를 cell이라고 함
         // 어떤 모양의 cell인지
         func collectionView(
              _ collectionView: UICollectionView,
              cellForItemAt indexPath: IndexPath
         ) -> UICollectionViewCell {
                guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: cellView.identifier,
                for: indexPath) as? cellView else {
                    return cellView()
                }
             return cell
         }
          
         // 컬렉션 뷰의  샤이즈
         func collectionView(
              _ collectionView: UICollectionView,
              layout collectionViewLayout: UICollectionViewLayout,
              sizeForItemAt indexPath: IndexPath
         ) -> CGSize {
             let margin: CGFloat = 10
              return CGSize(width: (self.view.frame.width - (margin * 3)) / 2, height: self.view.frame.height / 4)
         }
    
    
    func makeView(){
        label.snp.makeConstraints{ make in
            make.center.equalTo(0)
        }
        cView.snp.makeConstraints{ make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
 }

