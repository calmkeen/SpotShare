//
//  mapView.swift
//  mySpot
//
//  Created by calmkeen on 2022/06/20.
//

import Foundation
import SnapKit
import MapKit

class MapView: UIView{
    
    let map = MKMapView()
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.addSubview(map)
            make()
        }

    required init?(coder: NSCoder) {
        fatalError()
    }
   
    
    func make(){
        map.snp.makeConstraints { make in
            make.left.right.equalTo(self.safeAreaLayoutGuide)
            make.top.bottom.equalTo(self.safeAreaLayoutGuide).offset(20)
        }
        
    }
}
