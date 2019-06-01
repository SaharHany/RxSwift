//
//  ViewModel.swift
//  RxSwift-Example2
//
//  Created by JETS Mobile Lab-10 on 5/28/19.
//  Copyright © 2019 Sally Ahmed. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import RxCocoa

class ViewModel {
    var publishSubject = PublishSubject<Dictionary<String,Double>>()
    var url :String
    var alamofireService : AlamofireService
    var viewModelDisposeBag = DisposeBag()
    
    var currencyValueObservable : Observable<Dictionary<String,Double>>?
    

    init(url:String) {
        self.url = url
        currencyValueObservable = publishSubject.asObservable()

        alamofireService = AlamofireService(url: url)
        getJson()
      
    }
    
    func getJson(){
        let response = alamofireService.getJson()
        response.subscribe(onNext: {
            (r, json) in
            
            
            if let dict = json as? [String:Any]{
                var rootClass = RootClass(base: (dict["base"] as? String)!,rates:  (dict["rates"] as? [String:Double])!,date:(dict["date"] as? String)!)
                
                self.publishSubject.onNext(rootClass.rates)
                
            }
        }).disposed(by: viewModelDisposeBag)
    }
    
}
