//
//  ViewController.swift
//  SpotShare
//
//  Created by calmkeen on 2022/05/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let addView = AddPhotoSpotView()
    
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
    
    let weeekendSpotScrollView: UIScrollView = {
        let SpotScroll = UIScrollView()
        SpotScroll.backgroundColor = .white
        SpotScroll.contentMode = .scaleAspectFill
        return SpotScroll
    }()

    let SpotStack: UIStackView = {
        let SpotStack = UIStackView()
        SpotStack.translatesAutoresizingMaskIntoConstraints = false
        SpotStack.axis = .horizontal
        SpotStack.distribution = .equalSpacing
        SpotStack.alignment = .fill
        SpotStack.distribution = .fillEqually
        SpotStack.spacing = 20
        //SpotStack.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return SpotStack
    }()
    
    let weeekendphotoScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
       return scrollView
    }()
    let weekendphotoImageList = UIImageView()
    let weekendPhotoImageLabel = UILabel()
    
    let weekendPayScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
       return scrollView
    }()
    let weekendPayImageList = UIImageView()
    let weekendPayImageLabel = UILabel()
    
    let weekendDirectorView: UIView = {
        let DirectorView = UIScrollView()
        DirectorView.backgroundColor = .white
       return DirectorView
    }()
    let weekendDirectorImageList = UIImageView()
    let weekendDirectorImageLabel = UILabel()
    
    //하단 뷰 이동 툴바
    let searchViewTransformBtn: UIButton = {
       let searchBtn = UIButton()
        searchBtn.setImage(UIImage(named: "도라에몽"), for: .normal)
        return searchBtn
    }()
    let ContentViewTranfsformBtn: UIButton = {
        let ContentBtn = UIButton()
        ContentBtn.setImage(UIImage(named: "주술회전"), for: .normal)
         return ContentBtn
    }()
    let albumViewTransformBtn: UIButton = {
        var albumBtn = UIButton()
        albumBtn.frame = CGRect(x: 0, y: 0 , width: 10, height: 10)
        albumBtn.setImage(UIImage(named: "원피스"), for: .normal)
        albumBtn.imageView?.contentMode = .scaleAspectFit
         return albumBtn
    }()
    let SettingViewTransformBtn: UIButton = {
        let settingBtn = UIButton()
        settingBtn.setImage(UIImage(named: "귀멸의 칼날"), for: .normal)
         return settingBtn
    }()
    
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
        addContentBtn.addTarget(self, action: #selector(addBtnClick), for: .touchUpInside)
        
        //스크롤 뷰들
        self.mainViewPage.addArrangedSubview(weeekendSpotScrollView)
        weeekendSpotScrollView.backgroundColor = .white
        
        
        
        self.mainViewPage.addArrangedSubview(weeekendphotoScrollView)
        self.mainViewPage.addArrangedSubview(weekendPayScrollView)
        self.mainViewPage.addArrangedSubview(weekendDirectorView)
        
        //view.addSubview(weekendSpotImageLabel)
        //스크롤뷰에 따를 이미지
        //        view.addSubview(weekendSpotImageList)
        //        view.addSubview(weekendphotoImageList)
        //        view.addSubview(weekendPayImageList)
        //        view.addSubview(weekendDirectorImageList)
                //하단 툴바 뷰
                view.addSubview(searchViewTransformBtn)
                view.addSubview(ContentViewTranfsformBtn)
                view.addSubview(albumViewTransformBtn)
                view.addSubview(SettingViewTransformBtn)
        
        
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
        
        for count in 0..<5 {
            let weekendSpotImageList: UIImageView = {
                let SpotImageList = UIImageView()
                SpotImageList.image = UIImage(named: "짱구")
                SpotImageList.contentMode = .scaleAspectFit
                return SpotImageList
            }()
            //label
            let weekendSpotImageLabel:UILabel = {
                let SpotLabel = UILabel()
                SpotLabel.text = "금주의 스팟!\(count+1)"
                return SpotLabel
            }()
            let iconView: UIView = {
                let dataStack = UIView()
                dataStack.contentMode = .scaleAspectFill
                return dataStack
            }()
            iconView.snp.makeConstraints{ make in
                iconView.addSubview(weekendSpotImageList)
                iconView.addSubview(weekendSpotImageLabel)
                
                //make.height.width.equalTo(view.safeAreaLayoutGuide)

            }
            weekendSpotImageList.snp.makeConstraints{ make in
                make.width.height.equalTo(90)
                make.left.equalTo(10)
                make.centerX.equalTo(50)
                make.top.equalTo(50)
                //make.top.equalTo(SpotStack.snp.top).inset(5)
            }
            weekendSpotImageLabel.snp.makeConstraints{ label in
                label.bottom.equalTo(5)
                //label.left.equalTo(view.safeAreaLayoutGuide).inset(15)
            }
            
            SpotStack.addArrangedSubview(iconView)
            SpotStack.addArrangedSubview(weekendSpotImageList)
        }

        weeekendSpotScrollView.addSubview(SpotStack)
        
        //금주 스팟 스크롤 뷰
        weeekendphotoScrollView.snp.makeConstraints{ make in
            make.height.equalTo(self.view).multipliedBy(0.19)
        }
        
        weeekendphotoScrollView.snp.makeConstraints{ make in
            make.height.equalTo(self.view).multipliedBy(0.19)
        }
        weekendPayScrollView.snp.makeConstraints{ make in
            make.height.equalTo(self.view).multipliedBy(0.19)
        }
        weekendDirectorView.snp.makeConstraints{ make in
            make.height.equalTo(self.view).multipliedBy(0.28)
        }
        
        SpotStack.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }

        searchViewTransformBtn.snp.makeConstraints{ make in
            make.left.equalTo(weekendDirectorView.snp.left).inset(10)
            make.bottom.equalTo(weekendDirectorView.snp.bottom)
        }
        ContentViewTranfsformBtn.snp.makeConstraints{ make in
            make.left.equalTo(searchViewTransformBtn.snp.right).offset(10)
            make.bottom.equalTo(weekendDirectorView.snp.bottom)
        }
        albumViewTransformBtn.snp.makeConstraints{ make in
            make.left.equalTo(ContentViewTranfsformBtn.snp.right).offset(10)
            make.bottom.equalTo(weekendDirectorView.snp.bottom)
            make.height.width.equalTo(100)
        }
        SettingViewTransformBtn.snp.makeConstraints{ make in
            make.left.equalTo(albumViewTransformBtn.snp.right).offset(10)
            make.bottom.equalTo(weekendDirectorView.snp.bottom)
        }
        
    }
    @objc func addBtnClick(){
//        let vc = ViewController()
//        let vc1 = AddPhotoSpotView()
//        let nav = UINavigationController(rootViewController: vc)
//                nav.modalPresentationStyle = .fullScreen
//                self.present(nav, animated: true)
        let vc = addView
           self.navigationController?.pushViewController(vc, animated: true)
        vc.addViewSetup()
    }

}
