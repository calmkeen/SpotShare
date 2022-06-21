//
//  addView.swift
//  mySpot
//
//  Created by calmkeen on 2022/06/17.
//

import Foundation
import UIKit
import SnapKit

class AddView: UIViewController{
    
    let addViewStack: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "addView"
        return label
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        View()
        Make()
        print("addView")
        
    }
    
    func View(){
        view.addSubview(addViewStack)
        addViewStack.addSubview(label)
    }
    func Make(){
        addViewStack.snp.makeConstraints{make in
            make.edges.equalTo(view.self.safeAreaLayoutGuide)
        }
        label.snp.makeConstraints{ make in
            make.top.equalTo(100)
        }
    }
}
