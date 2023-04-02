//
//  Extentions.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/3/23.
//

import UIKit

extension UIView {
    func addSubviews (_ views: UIView...){
        views.forEach({self.addSubview($0)})
    }
}
