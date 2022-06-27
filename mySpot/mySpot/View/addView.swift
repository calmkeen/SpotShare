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
    let addlabel: UILabel = {
        let label = UILabel()
        label.text = "addView"
        return label
    }()
    let imageAdd = UIImage()
    let nameLabel = UILabel()
    let tagLabel = UILabel()
    let selectType = UILabel()
    
    let nameText: UITextField = {
        let text = UITextField()
        text.text = "이름을 입력하세요"
        return text
    }()
    let tagText: UITextField = {
        let text = UITextField()
        text.text = "내용을 입력하세요"
        return text
    }()
    
    let selectBtn = UIButton()
    let addBtn = UIButton()
    let cancelBtn = UIButton()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        View()
        Make()
        print("addView")
        
    }
    
    func View(){
        view.addSubview(addViewStack)
        addViewStack.addSubview(addlabel)
    }
    func Make(){
        addViewStack.snp.makeConstraints{make in
            make.edges.equalTo(view.self.safeAreaLayoutGuide)
        }
        addlabel.snp.makeConstraints{ make in
            make.top.equalTo(100)
        }
    }
}
