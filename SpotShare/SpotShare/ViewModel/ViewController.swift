//
//  ViewController.swift
//  SpotShare
//
//  Created by calmkeen on 2022/05/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    // 상단 부분
    let searchBar = UISearchBar()
    let addContentBtn = UIButton()
    let topToolbar: UIView =
    {
        let topbar = UIView()
        topbar.backgroundColor = .white
        return topbar
    }()
    //메인 스크롤뷰들
    let mainViewPage: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .black
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    //금주 스팟 뷰
    let iconView = UIView()
    let weeekendSpotScrollView: UIScrollView = {
        let SpotScroll = UIScrollView()
        return SpotScroll
    }()
    
    
    let SpotStack: UIStackView = {
        let SpotStack = UIStackView()
        SpotStack.axis = .horizontal
        SpotStack.distribution = .equalSpacing
        SpotStack.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return SpotStack
    }()
    
    let weeekendphotoScrollView = UIScrollView()
    let weekendphotoImageList = UIImageView()
    let weekendPhotoImageLabel = UILabel()
    
    let weekendPayScrollView = UIScrollView()
    let weekendPayImageList = UIImageView()
    let weekendPayImageLabel = UILabel()
    
    let weekendDirectorView = UIView()
    let weekendDirectorImageList = UIImageView()
    let weekendDirectorImageLabel = UILabel()
    
    //하단 뷰 이동 툴바
    let searchViewTransformBtn = UIButton()
    let ContentViewTranfsformBtn = UIButton()
    let albumViewTransformBtn = UIButton()
    let SettingViewTransformBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView(){
        
        //main
        view.addSubview(mainViewPage)
        //상단 뷰의 생성
        view.addSubview(topToolbar)
        view.addSubview(searchBar)
        view.addSubview(addContentBtn)
        addContentBtn.backgroundColor = .blue
        addContentBtn.layer.cornerRadius = 15
        
        //스크롤 뷰들
        self.mainViewPage.addArrangedSubview(weeekendSpotScrollView)
        weeekendSpotScrollView.backgroundColor = .white
        weeekendSpotScrollView.addSubview(SpotStack)
        //SpotStack.addArrangedSubview(iconView)
        
        
        for count in 0..<100
        {
            let weekendSpotImageList: UIImageView = {
                let SpotImageList = UIImageView()
                SpotImageList.image = UIImage(named: "짱구")
                SpotImageList.contentMode = .scaleAspectFit
                return SpotImageList
            }()
            
            let weekendSpotImageLabel:UILabel = {
                let SpotLabel = UILabel()
                SpotLabel.text = "금주의 스팟!\(count+1)"
                return SpotLabel
            }()
            iconView.addSubview(weekendSpotImageLabel)
            iconView.addSubview(weekendSpotImageList)
            
            weekendSpotImageList.snp.makeConstraints{ make in
                //make.centerX.equalTo(view.safeAreaLayoutGuide)
            }
            weekendSpotImageLabel.snp.makeConstraints{ label in
                //label.top.equalTo(weeekendSpotScrollView.snp.bottom).inset(15)
                //label.left.equalTo(view.safeAreaLayoutGuide).inset(15)
            }
            
            SpotStack.addArrangedSubview(iconView)
        }
        
        self.mainViewPage.addArrangedSubview(weeekendphotoScrollView)
        weeekendphotoScrollView.backgroundColor = .gray
        self.mainViewPage.addArrangedSubview(weekendPayScrollView)
        weekendPayScrollView.backgroundColor = .lightGray
        self.mainViewPage.addArrangedSubview(weekendDirectorView)
        weekendDirectorView.backgroundColor = .darkGray
        
        //view.addSubview(weekendSpotImageLabel)
        //스크롤뷰에 따를 이미지
        //        view.addSubview(weekendSpotImageList)
        //        view.addSubview(weekendphotoImageList)
        //        view.addSubview(weekendPayImageList)
        //        view.addSubview(weekendDirectorImageList)
        //        //하단 툴바 뷰
        //        view.addSubview(searchViewTransformBtn)
        //        view.addSubview(ContentViewTranfsformBtn)
        //        view.addSubview(albumViewTransformBtn)
        //        view.addSubview(SettingViewTransformBtn)
        //
        
        //mainview
        mainViewPage.snp.makeConstraints{ make in
            make.left.right.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.top.equalTo(topToolbar.snp.bottom).inset(5)
        }
        
        //상단 뷰
        topToolbar.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.left.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(45)
        }
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.size.height.equalTo(40)
            make.left.equalTo(view.safeAreaLayoutGuide).inset(45)
            make.right.equalTo(view.safeAreaLayoutGuide)
        }
        addContentBtn.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.size.width.height.equalTo(35)
            make.left.equalTo(view.safeAreaLayoutGuide).inset(5)
            make.right.equalTo(searchBar.snp.left).inset(-5)
            
        }
        SpotStack.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        
        //스크롤뷰
    }
}

