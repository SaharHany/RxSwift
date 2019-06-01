import UIKit
import RxSwift
import RxCocoa
let disposeBag = DisposeBag()
// 1
Observable.of(2, 2, 3, 4, 4).filter { $0 > 2 }.subscribe(onNext: { (value) in
        print(value)
    }).disposed(by: disposeBag)
