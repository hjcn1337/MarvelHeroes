//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by Ростислав Ермаченков on 19.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let charactersApi = CharactersApi()
    
    private var viewModel: CharactersViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CharactersViewModel()
        
        var sss = viewModel.characters.asObservable().subscribe { (chs) in
            print(chs)
        } 

        
        // Do any additional setup after loading the view.
    }


}

