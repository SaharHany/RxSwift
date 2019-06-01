//
//  AlamofireService.swift
//  RxSwift-Example2
//
//  Created by JETS Mobile Lab-10 on 5/28/19.
//  Copyright © 2019 Sally Ahmed. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RxAlamofire

class AlamofireService : AlamofireServiceProtocol{
    var alamofireDisposeBag = DisposeBag()
    var url : String?
    init(url:String){
        self.url = url
    }
    func getJson()->Observable<(HTTPURLResponse, Any)>{
        let observable = RxAlamofire.requestJSON(.get,url!)
        return observable
    }
}
