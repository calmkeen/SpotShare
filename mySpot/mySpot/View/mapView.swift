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
            configure()
            make()
        }
    required init?(coder: NSCoder) {
        fatalError()
    }
    func configure(){
        
    }
    
    func make(){
        map.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
