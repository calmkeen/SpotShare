//
//  mainView.swift
//  mySpot
//
//  Created by calmkeen on 2022/06/17.
//

import Foundation
import SnapKit
import MapKit
import UIKit
import CoreLocation


class MainView:UIViewController,MKMapViewDelegate,CLLocationManagerDelegate{
    
    let listView = ListCateView()
    let addView = AddView()
    let sesacLocationButton = UIButton()
    let myLocationButton = UIButton()
    
    let mapView = MapView()
    let startCoordinate = CLLocationCoordinate2D(latitude: 37.51818789942772, longitude: 126.88541765534976)
    let locationManager = CLLocationManager()
    
    override func loadView() {
        super.loadView()
        mainView = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        mapView.map.delegate = self
        mapView.map.setRegion(MKCoordinateRegion(center: startCoordinate, span: MKCoordinateSpan(latitudeDelta: 37.5, longitudeDelta: 127.04)), animated: true)
        locationManager.requestWhenInUseAuthorization()
        setMainView()
        make()
        configure()
        buttonActions()
        //self.navigationController?.navigationBar.isHidden = true;
    }
    
    var mainView: UIView = {
        let main = UIView()
        return main
    }()
    let addBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        return button
    }()
    let listBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "list.dash"), for: .normal)
        return button
    }()
    
    func configure(){
        myLocationButton.setTitle("내 위치로 가기", for: .normal)
        myLocationButton.backgroundColor = .darkGray
        myLocationButton.setTitleColor(.yellow, for: .normal)
        myLocationButton.layer.cornerRadius = 15
        
        sesacLocationButton.setTitle("새싹 캠퍼스 가기", for: .normal)
        sesacLocationButton.backgroundColor = .darkGray
        sesacLocationButton.setTitleColor(.yellow, for: .normal)
        sesacLocationButton.layer.cornerRadius = 15
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func PinPoint(){
        let pin = MKPointAnnotation()
        pin.coordinate = startCoordinate
        pin.title = "영등포"
        pin.subtitle = "3층짜리 건물"
        mapView.map.addAnnotation(pin)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            // 유저 위치를 나타낼때는 기본 파란 그 점 아시죠? 그거 쓰고싶으니까~ 요렇게 해주시고 만약에 쓰고싶은 어노테이션이 있다면 그녀석을 리턴해 주시면 되긋죠? 하하!
            return nil
        }
        return nil
    }
    
    @objc func findSesacLocation() {
        
        mapView.map.showsUserLocation = false
        
        mapView.map.userTrackingMode = .none
        
        mapView.map.setRegion(MKCoordinateRegion(center: startCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.11)), animated: true)
    }
    
    @objc func findMyLocation() {
        
        guard let currentLocation = locationManager.location else {
            checkUserLocationServicesAuthorization()
            return
        }
        
        mapView.map.showsUserLocation = true
        
        mapView.map.setUserTrackingMode(.follow, animated: true)
    }
    
    func checkCurrentLocationAuthorization(authorizationStatus: CLAuthorizationStatus) {
        switch authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        case .restricted:
            print("restricted")
            goSetting()
        case .denied:
            print("denided")
            goSetting()
        case .authorizedAlways:
            print("always")
        case .authorizedWhenInUse:
            print("wheninuse")
            locationManager.startUpdatingLocation()
        @unknown default:
            print("unknown")
        }
        if #available(iOS 14.0, *) {
            let accuracyState = locationManager.accuracyAuthorization
            switch accuracyState {
            case .fullAccuracy:
                print("full")
            case .reducedAccuracy:
                print("reduced")
            @unknown default:
                print("Unknown")
            }
        }
    }
    
    func setMainView(){
        view.addSubview(mapView)
        view.backgroundColor = .white
        mainView.addSubview(addBtn)
        mainView.addSubview(listBtn)
        mainView.addSubview(myLocationButton)
        mainView.addSubview(sesacLocationButton)
    }
    
    func make(){
        mainView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        addBtn.snp.makeConstraints{ make in
            make.right.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(30)
        }
        listBtn.snp.makeConstraints{ make in
            make.left.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(30)
        }
        myLocationButton.snp.makeConstraints { make in
            make.right.equalTo(self.view.safeAreaLayoutGuide).inset(30)
            make.bottom.equalTo(addBtn.snp.top).offset(-20)
            
        }
        sesacLocationButton.snp.makeConstraints { make in
            make.bottom.equalTo(myLocationButton.snp.top).offset(-20)
            make.right.equalTo(self.view.safeAreaLayoutGuide).inset(30)
        }
        
    }
    @objc func addBtnClick(){
        let vc =  addView
        navigationController?.pushViewController(vc, animated: true)
        print("moving to AddView")
    }
    @objc func listBtnClick(){
        let vc = listView
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        print("moving to listView")
        
    }
    func goSetting() {
        
        let alert = UIAlertController(title: "위치권한 요청", message: "러닝 거리 기록을 위해 항상 위치 권한이 필요합니다.", preferredStyle: .alert)
        let settingAction = UIAlertAction(title: "설정", style: .default) { action in
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            // 열 수 있는 url 이라면, 이동
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { UIAlertAction in
            
        }
        
        alert.addAction(settingAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func checkUserLocationServicesAuthorization() {
        let authorizationStatus: CLAuthorizationStatus
        if #available(iOS 14, *) {
            authorizationStatus = locationManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        
        if CLLocationManager.locationServicesEnabled() {
            checkCurrentLocationAuthorization(authorizationStatus: authorizationStatus)
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(#function)
        checkUserLocationServicesAuthorization()
    }
    func buttonActions() {
        myLocationButton.addTarget(self, action: #selector(findMyLocation), for: .touchUpInside)
        sesacLocationButton.addTarget(self, action: #selector(findSesacLocation), for: .touchUpInside)
        addBtn.addTarget(self, action: #selector(addBtnClick), for: .touchUpInside)
        listBtn.addTarget(self, action: #selector(listBtnClick), for: .touchUpInside)
    }
}


