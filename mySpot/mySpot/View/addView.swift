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
    
    //let mainview = MainView()
    let listview = ListCateView()
    
    let addViewStack: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let addlabel: UILabel = {
        let label = UILabel()
        label.text = "게시물 추가"
        label.font = UIFont.systemFont(ofSize: 30)
        
        return label
    }()
    let imageAdd: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "도라에몽")
        image.backgroundColor = .gray
        image.layer.cornerRadius = 15

        return image
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.font = UIFont.systemFont(ofSize: 20)
        
        label.layer.cornerRadius = 10
        return label
    }()
    let tagLabel: UILabel = {
        let tag = UILabel()
        tag.text = "Tag"
        tag.font = UIFont.systemFont(ofSize: 20)
        
        tag.layer.cornerRadius = 10
        return tag
    }()
    let selectType: UILabel = {
        let type = UILabel()
        type.text = "분류"
        type.font = UIFont.systemFont(ofSize: 20)
        type.layer.cornerRadius = 10
        return type
    }()
    
    let nameText: UITextField = {
        let text = UITextField()
        text.text = "  이름을 입력하세요"
        text.layer.borderWidth = 2
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 5
        return text
    }()
    let tagText: UITextField = {
        let text = UITextField()
        text.text = "  내용을 입력하세요"
        text.layer.borderWidth = 2
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 5
        return text
    }()
    
    let selectBtn = UIButton()
    let addBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus.square.on.square"), for: .normal)
        return btn
    }()
    let cancelBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        return btn
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        View()
        Make()
        print("addView!!")
        configure()
        buttonAction()
        
    }
    
    func configure(){
    }
    
    func View(){
        view.addSubview(addViewStack)
        addViewStack.addSubview(addlabel)
        addViewStack.addSubview(imageAdd)
        addViewStack.addSubview(nameLabel)
        addViewStack.addSubview(tagLabel)
        addViewStack.addSubview(selectType)
        addViewStack.addSubview(nameText)
        addViewStack.addSubview(tagText)
        addViewStack.addSubview(selectBtn)
        addViewStack.addSubview(cancelBtn)
        addViewStack.addSubview(addBtn)
        
    }
    func Make(){
        addViewStack.snp.makeConstraints{ make in
            make.edges.equalTo(view.self.safeAreaLayoutGuide)
        }
        addlabel.snp.makeConstraints{ make in
            make.top.equalTo(20)
            make.left.right.equalTo(20)
        }
        imageAdd.snp.makeConstraints{ make in
            make.top.equalTo(addlabel.snp.bottom).offset(15)
            make.left.right.equalTo(20)
        }
        nameLabel.snp.makeConstraints{ make in
            make.top.equalTo(imageAdd.snp.bottom).offset(35)
            make.left.equalTo(20)
            make.width.equalTo(35)
        }
        nameText.snp.makeConstraints{ make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(40)
        }
        tagLabel.snp.makeConstraints{ make in
            make.top.equalTo(nameText.snp.bottom).offset(10)
            make.left.equalTo(20)
            make.width.equalTo(40)
        }
        tagText.snp.makeConstraints{ make in
            make.top.equalTo(tagLabel.snp.bottom).offset(5)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(40)
        }
        selectType.snp.makeConstraints{ make in
            make.top.equalTo(tagText.snp.bottom).offset(10)
            make.left.equalTo(20)
            make.width.equalTo(40)
        }
        addBtn.snp.makeConstraints{make in
            make.top.equalTo(selectType.snp.bottom).offset(5)
            make.left.equalTo(20)
        }
        cancelBtn.snp.makeConstraints{make in
            make.left.equalTo(addBtn.snp.right).offset(20)
            make.top.equalTo(selectType.snp.bottom).offset(5)
            make.right.equalTo(20)
        }
    }
    @objc func addBtnClcik(sender: UIButton){
        let vc =  MainView()
        navigationController?.pushViewController(vc, animated: true)
        print("저장되었습니다.")

    }
//    @objc func cancelBtnClick(sender: UIButton){
//        let vc = listview
//        navigationController?.pushViewController(vc, animated: true)
//        print("취소")
//    }
    func buttonAction(){
        addBtn.addTarget(self, action: #selector(addBtnClcik), for: .touchUpInside)
//        cancelBtn.addTarget(self, action: #selector(cancelBtnClick), for: .touchUpInside)
    }

    
}
