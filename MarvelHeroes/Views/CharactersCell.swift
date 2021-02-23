//
//  CharacterCell.swift
//  MarvelHeroes
//
//  Created by Ростислав Ермаченков on 23.02.2021.
//

import Foundation
import UIKit

protocol CharactersCellViewModel {
    var name: String { get }
    var description: String? { get }
}


class CharactersCell: UITableViewCell {
    
    static let reuseId = "CharactersCell"
    
    let cellView: UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let chrImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = #colorLiteral(red: 0.8234507442, green: 0.3115251064, blue: 0.3296223879, alpha: 1)
        return image
    }()
    
    
    let descriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()


    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        overlayFirstLayer()
        overlayCardView()
    }
    
    private func overlayCardView() {
        cellView.addSubview(nameLabel)
        cellView.addSubview(descriptionLabel)
        cellView.addSubview(chrImageView)
        
        nameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        chrImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        chrImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10).isActive = true
        chrImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        chrImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        descriptionLabel.topAnchor.constraint(equalTo: chrImageView.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20).isActive = true
        //descriptionLabel.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
    }
    
     private func overlayFirstLayer() {
        if #available(iOS 14.0, *) {
            contentView.addSubview(cellView)
        } else {
            addSubview(cellView)
        }
    
        cellView.fillSuperview(padding: Constants.cellInsets)
    }
    
    func set(viewModel: CharactersCellViewModel) {
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
