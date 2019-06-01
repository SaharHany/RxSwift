//
//  CurrencyViewController.swift
//  RxSwift-Example2
//
//  Created by JETS Mobile Lab-10 on 5/28/19.
//  Copyright © 2019 Sally Ahmed. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CurrencyViewController: UIViewController {

    var viewModel = ViewModel(url: "https://api.exchangeratesapi.io/latest")
    var viewDisposeBag = DisposeBag()
    
    @IBOutlet weak var currencyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.currencyValueObservable?.bind(to: self.currencyTableView.rx.items(cellIdentifier: "currencyCell", cellType: CurrencyTableViewCell.self))
        { (row , data , cell) in
            cell.valueLabel.text = String(data.value)
            cell.currencyLabel.text = data.key

            }
            .disposed(by: viewDisposeBag)
        
        // Do any additional setup after loading the view.
    }
    

}
