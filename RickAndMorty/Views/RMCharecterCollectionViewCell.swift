//
//  RMCharecterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/3/23.
//

import UIKit

/// Single cell for character in CharacterListView
final class RMCharecterCollectionViewCell: UICollectionViewCell {
   static let cellIdentifier = "RMCharecterCollectionViewCell"
    
    // MARK: - UI components
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18 , weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        
        contentView.addSubviews(imageView,nameLabel,infoLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            infoLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            infoLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 8),
            infoLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -3),
            
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -5),
            
            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: infoLabel.topAnchor ),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor , constant: -3),
            
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        infoLabel.text = nil
    }
    
    
    public func configure(with viewModel:RMCharecterCollectionViewCellViewModel){
        nameLabel.text = viewModel.characterName
        infoLabel.text = viewModel.characterInfoText
        infoLabel.numberOfLines = 2
        viewModel.fetchImage { [weak self] result in

            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let err):
                print(String(describing: err))
                break
            }
        }
    }
}

