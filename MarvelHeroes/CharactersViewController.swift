//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by Ростислав Ермаченков on 19.02.2021.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class CharactersViewController: UIViewController {
    
    private var viewModel: CharactersViewModel!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var table: UITableView!
    
    private lazy var footerView = FooterView()
    
    private var refreshControl: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    @objc private func refresh() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CharactersViewModel()
        
        configureTableView()
        bind()
        
//        var sss = viewModel.characters.asObservable().subscribe { (chs) in
//            print(chs)
//        }

    }
    
    private func configureTableView() {
        table.register(CharactersCell.self, forCellReuseIdentifier: CharactersCell.reuseId)
        table.rowHeight = 300
    }
    
    private func bind() {
        let resizingProcessor = ResizingImageProcessor(referenceSize: CGSize(width: 120, height: 120), mode: .aspectFit)
        
        viewModel.characters.asObservable()
            .bind(to: table.rx.items(cellIdentifier: CharactersCell.reuseId, cellType: CharactersCell.self)) { [weak self]
                row, model, cell in
                cell.nameLabel.text = model.name
                cell.descriptionLabel.text = model.description

                cell.chrImageView.kf.setImage(with: URL(string: model.imageUrlString), placeholder: nil, options: [.processor(resizingProcessor)]) { [weak self] result in
                    cell.setNeedsLayout()
                }
                
            }.disposed(by: disposeBag)
       }
}
