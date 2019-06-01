//
//  ViewController.swift
//  RxSwift-Example2
//
//  Created by Sally on 5/24/19.
//  Copyright © 2019 Sally Ahmed. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var onOffSwitch: UISwitch!
    @IBOutlet weak var mainButton: UIButton!
    let disposeBag = DisposeBag()

    let publishSubject = PublishSubject<String>()
    let behaviourSubject = BehaviorSubject<String>(value: "T1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let strValue = try? behaviourSubject.value()
        if strValue != nil {
            print(strValue!)
        }
        behaviourSubject.subscribe(onNext: { (value) in
            print(value)
        }).disposed(by: disposeBag)
        behaviourSubject.onNext("T3")
        
        publishSubject.onNext("Test 1")
        publishSubject.subscribe(onNext: { (value) in
            print(value)
        }).disposed(by: disposeBag)
        
        publishSubject.onNext("Test 2")
        mainButton
            .rx
            .tap
            .throttle(2, scheduler: MainScheduler.asyncInstance)
            .subscribe(onNext: { (_) in
                print("tap")
            }).disposed(by: disposeBag)
        
        
//        let items = Observable.just(
//            (0..<20).map{ "Example \($0)" }
//        )
        
        onOffSwitch.rx.isOn.subscribe(onNext: { isChanged in
            print(isChanged)
        }).disposed(by: disposeBag)
   
        let items = Observable.of(["Example 1","Example 2","Example 3", "Example 4" , "Example 5"])
        
        items.asObservable()
            .bind(to: self.mainTableView.rx.items(cellIdentifier: "textCell", cellType: TextTableViewCell.self))
            { (row , data , cell) in
            cell.titleLbl.text = data}
            .disposed(by: disposeBag)
      
        self.mainTableView
            .rx
            .modelSelected(String.self)
            .subscribe(onNext: { [weak self] (value) in
            let alert = UIAlertController(title: "", message: value, preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(action)
            self?.present(alert, animated: true, completion: nil)
        }).disposed(by: disposeBag)

    }


}

