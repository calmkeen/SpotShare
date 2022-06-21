//
//  AddPhotoSpotView.swift
//  SpotShare
//
//  Created by calmkeen on 2022/06/10.

import Foundation
import SnapKit
import UIKit


class AddPhotoSpotView: UIViewController{
    
    
    let addSpotVIew: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let titleField: UITextField = {
      let text = UITextField()
        text.backgroundColor = .lightGray
        text.placeholder = "게시물 제목을 입력하세요"
        return text
    }()
    
    let addImage: UIImageView = {
      let image = UIImageView()
        image.image = UIImage(named: "도라에몽")
        return image
    }()
    
    let selectPS: UIButton = {
      let selectBox = UIButton()
        selectBox.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
        return selectBox
    }()
    
    let selectPrivacy: UIButton = {
      let selectBox = UIButton()
        return selectBox
    }()
    let location: UITextField = {
        let text = UITextField()
          text.backgroundColor = .lightGray
          text.placeholder = "위치정보를 기입해주세요"
          return text
    }()
    let locationDetail: UITextField = {
        let text = UITextField()
          text.backgroundColor = .lightGray
          text.placeholder = "위치정보를 자세히 적어주세요"
          return text
    }()
    let tag: UITextField = {
        let text = UITextField()
          text.backgroundColor = .lightGray
          text.placeholder = "해당 게시물의 태그를 적어주세요"
          return text
    }()
    let detail: UITextField = {
        let text = UITextField()
          text.backgroundColor = .lightGray
          text.placeholder = "게시물의 내용을 말해주세요"
          return text
    }()
    let addBtn: UIButton = {
      let button = UIButton()
        button.setImage(UIImage(systemName: "plus.diamond"), for: .normal)
        return button
    }()
    
    func addViewSetup(){
        
        view.backgroundColor = .gray
        
        view.addSubview(addSpotVIew)
        self.addSpotVIew.addSubview(titleField)
        self.addSpotVIew.addSubview(addImage)
        
        addSpotVIew.addSubview(addBtn)
        addBtn.addTarget(self, action: #selector(addContextBtn), for: .touchUpInside)
        
        addSpotVIew.addSubview(selectPS)
        addSpotVIew.addSubview(selectPrivacy)
        addSpotVIew.addSubview(location)
        addSpotVIew.addSubview(locationDetail)
        addSpotVIew.addSubview(tag)
        addSpotVIew.addSubview(detail)
     
        
        
        addSpotVIew.snp.makeConstraints{ make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        titleField.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.left.right.equalTo(self.view.safeAreaLayoutGuide).offset(10)
        }
        addImage.snp.makeConstraints{ make in
            make.top.equalTo(titleField.snp.bottom).offset(20)
            make.left.right.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            make.height.equalTo(300)
            make.centerX.equalTo(0)
            
        }
        selectPS.snp.makeConstraints{ make in
            make.top.equalTo(addImage.snp.bottom).offset(25)
            make.left.right.equalTo(self.view.safeAreaLayoutGuide).offset(10)
        }
        
        location.snp.makeConstraints{ make in
            make.top.equalTo(selectPS.snp.bottom).offset(25)
            make.left.right.equalTo(self.view.safeAreaLayoutGuide).offset(10)
        }
        locationDetail.snp.makeConstraints{ make in
            make.top.equalTo(location.snp.bottom).offset(25)
            make.left.right.equalTo(self.view.safeAreaLayoutGuide).offset(10)
        }
        tag.snp.makeConstraints{ make in
            make.top.equalTo(locationDetail.snp.bottom).offset(25)
            make.left.right.equalTo(self.view.safeAreaLayoutGuide).offset(10)
        }
        detail.snp.makeConstraints{ make in
            make.top.equalTo(tag.snp.bottom).offset(25)
            make.left.right.equalTo(self.view.safeAreaLayoutGuide).offset(10)
        }
        addBtn.snp.makeConstraints{ make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(50)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            
        }
        func addImageBtn(){
        }
    }
    @objc func addContextBtn(){
        let albumCategory = albumCategoryView()
        navigationController?.pushViewController(albumCategory, animated: true)
        albumCategory.albumViewSetUp()
    }
}

extension AddPhotoSpotView{
    func texfieldUI(){

        let a: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            return view
        }()
             
    }
}
