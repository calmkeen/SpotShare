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
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var addContentBtn: UIButton!
    //메인 스크롤뷰들
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var mainViewPage: UIView!
    
    @IBOutlet weak var weeekendSpotScrollView: UIScrollView!
    @IBOutlet weak var weekendSpotImageList: UIImageView!
    
    @IBOutlet weak var weeekendphotoScrollView: UIScrollView!
    @IBOutlet weak var weekendphotoImageList: UIImageView!
    
    @IBOutlet weak var weekendPayScrollView: UIScrollView!
    @IBOutlet weak var weekendPayImageList: UIImageView!
    
    @IBOutlet weak var weekendDirectorView: UIView!
    @IBOutlet weak var weekendDirectorImageList: UIImageView!
    
//하단 뷰 이동 툴바
    @IBOutlet weak var searchViewTransformBtn: UIButton!
    @IBOutlet weak var ContentViewTranfsformBtn: UIButton!
    @IBOutlet weak var albumViewTransformBtn: UIButton!
    @IBOutlet weak var SettingViewTransformBtn: UIButton!
    

    func setupView(){
        
        view.addSubview(searchBar)
        view.addSubview(addContentBtn)
        //스크롤 뷰들
        view.addSubview(mainScrollView)
        view.addSubview(weeekendSpotScrollView)
        view.addSubview(weeekendphotoScrollView)
        view.addSubview(weekendPayScrollView)
        view.addSubview(weekendDirectorView)
        //스크롤뷰에 따를 이미지
        view.addSubview(weekendSpotImageList)
        view.addSubview(weekendphotoImageList)
        view.addSubview(weekendPayImageList)
        view.addSubview(weekendDirectorImageList)
        //하단 툴바 뷰
        view.addSubview(searchViewTransformBtn)
        view.addSubview(ContentViewTranfsformBtn)
        view.addSubview(albumViewTransformBtn)
        view.addSubview(SettingViewTransformBtn)
    }
    
    searchBar.snp.makeConstraints { make in
        make.top.equalTo(view.snp.top)
        make.size.width.height.equalTo(100)
        make.left.equalTo(view.snp.left)
    }

   


}

