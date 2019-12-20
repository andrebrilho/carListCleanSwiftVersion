//
//  CarTableViewCell.swift
//  CleanSwiftApiCars
//
//  Created by André Brilho on 12/09/19.
//  Copyright © 2019 André Brilho. All rights reserved.
//

import UIKit
import AlamofireImage

class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgCar: UIImageView!
    
    
    var carro:Main.Carro?{
        didSet{
            configureCell()
        }
    }
    
    func configureCell(){
        lblName.text = carro?.nome
        imgCar.image = nil
        imgCar.af_cancelImageRequest()
        imgCar.af_setImage(withURL: URL(string:((carro?.url_foto)!))!, filter: AspectScaledToFitSizeFilter(size: CGSize(width: self.imgCar.frame.width, height: self.imgCar.frame.height)), imageTransition: .crossDissolve(0.3), runImageTransitionIfCached: true, completion: { (_) in
        })
    }
    
}
