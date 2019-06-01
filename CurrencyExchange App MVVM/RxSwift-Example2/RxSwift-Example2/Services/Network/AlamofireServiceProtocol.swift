//
//  AlamofireServiceProtocol.swift
//  RxSwift-Example2
//
//  Created by JETS Mobile Lab-10 on 5/28/19.
//  Copyright © 2019 Sally Ahmed. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RxAlamofire
protocol  AlamofireServiceProtocol {
    func getJson()->Observable<(HTTPURLResponse, Any)>
}
