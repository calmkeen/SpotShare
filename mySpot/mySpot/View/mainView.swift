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


class MainView:UIViewController{
    
    let listView = ListCateView()
    let addView = AddView()
    
    let mapView = MapView()
    let startCoordinate = CLLocationCoordinate2D(latitude: 37.51818789942772, longitude: 126.88541765534976)
    let locationManager = CLLocationManager()
    
    let mainView: UIView = {
        let main = UIView()
        main.backgroundColor = .gray
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        mapView.map.delegate = self
        mapView.map.setRegion(MKCoordinateRegion(center: startCoordinate, span: MKCoordinateSpan(latitudeDelta: 37.5, longitudeDelta: 127.04)), animated: true)
        locationManager.requestWhenInUseAuthorization()
        setMainView()
        make()
        addBtn.addTarget(self, action: #selector(addBtnClick), for: .touchUpInside)
        listBtn.addTarget(self, action: #selector(listBtnClick), for: .touchUpInside)
        buttonActions()
        //self.navigationController?.navigationBar.isHidden = true;
    }
    
    override func loadView() {
        super.loadView()
        
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
}


extension MainView: MKMapViewDelegate,CLLocationManagerDelegate{
    
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
    func buttonActions() {
                    mapView.myLocationButton.addTarget(self, action: #selector(findMyLocation), for: .touchUpInside)
                    mapView.sesacLocationButton.addTarget(self, action: #selector(findSesacLocation), for: .touchUpInside)
    }
    func setMainView(){
        view.addSubview(mainView)
        view.backgroundColor = .white
        mainView.addSubview(addBtn)
        mainView.addSubview(listBtn)
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            // 유저 위치를 나타낼때는 기본 파란 그 점 아시죠? 그거 쓰고싶으니까~ 요렇게 해주시고 만약에 쓰고싶은 어노테이션이 있다면 그녀석을 리턴해 주시면 되긋죠? 하하!
            return nil
        }
        return nil
    }
    
    func make(){
        mainView.snp.makeConstraints{ make in
            //make.edges.equalTo(self.view.safeAreaLayoutGuide)
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        addBtn.snp.makeConstraints{ make in
            make.right.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(30)
        }
        listBtn.snp.makeConstraints{ make in
            make.left.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(30)
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
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(#function)
        checkUserLocationServicesAuthorization()
    }
    
}
