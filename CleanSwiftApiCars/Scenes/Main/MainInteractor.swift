//
//  MainInteractor.swift
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

protocol MainBusinessLogic {
    
    var numberOfRows: Int { get }
    func cellForRow(indexPath:IndexPath) -> Main.Carro
    func didSelectRow(indexPath: IndexPath)
 
}

protocol MainDataStore {
    var selectedCar: Main.Carro? { get set }
}

class MainInteractor: MainBusinessLogic, MainDataStore {
    
  var selectedCar: Main.Carro?
  var listCar:[Main.Carro] = []
    
  var worker: MainWorker
    init(worker:MainWorker = MainWorker()) {
        self.worker = worker
    }
    
  var presenter: MainPresentationLogic? {
    didSet {
        load()
    }
  }
    
    func load(){
        worker.getCarros().done(handleSuccess).catch(handleFailure)
    }
    
    func handleSuccess(model: Main.CarrosResponse) {
        listCar = model.carros.carro
        presenter?.reloadTable()
    }
    
    func handleFailure(error:Error) {
        print("OPS deu ruim")
    }
    
    var numberOfRows: Int {
        return listCar.count
    }
    
    func cellForRow(indexPath: IndexPath) -> Main.Carro {
        return listCar[indexPath.row]
    }
    
    func didSelectRow(indexPath: IndexPath) {
        selectedCar = listCar[indexPath.row]
        presenter?.routeToDetail()
    }
    
}