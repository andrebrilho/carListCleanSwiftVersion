//
//  MainWorker.swift
//  CleanSwiftApiCars
//
//  Created by André Brilho on 12/09/19.
//  Copyright (c) 2019 André Brilho. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import PromiseKit

class MainWorker {
    func getCarros() -> Promise<Main.CarrosResponse> {
        let url = URL(string: Constants.URL_BASE)!
        return Promise<Main.CarrosResponse> { seal in
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let objParse = try! JSONDecoder().decode(Main.CarrosResponse.self, from: data)
                    seal.fulfill(objParse)
                } else {
                  seal.reject(NSError(domain: "", code: 0, userInfo: nil))
                }
            }.resume()
        }
    }
}
