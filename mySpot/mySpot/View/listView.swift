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
        view.addSubview(listviewStack)
        listviewStack.addSubview(label)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        makeListView()
        makeView()
        print("listView")
    }
    
    
    
}
extension ListCateView{
    func makeView(){
        listviewStack.snp.makeConstraints{ make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        label.snp.makeConstraints{ make in
            make.center.equalTo(0)
        }
    }
}
