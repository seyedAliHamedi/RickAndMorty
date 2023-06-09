//
//  RMCharacterListView.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/3/23.
//

import UIKit

/// View that handles showing list of characters , loader and etc...
class RMCharacterListView: UIView {
    
    private let viewModel = RMCharacterListViewModel()
    // MARK: - UI components
    
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMCharecterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharecterCollectionViewCell.cellIdentifier)
        collectionView.alpha = 0
        return collectionView
    }()
    
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("UNsupported")
    }
    
    // MARK: - Setup UI
    
    private func setupUI(){
        addSubviews(collectionView,spinner)
        addConstraints()
        spinner.startAnimating()
        viewModel.fetchAllCharaters()
        viewModel.delegate = self
        setupCollectionView()
        
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setupCollectionView(){
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
        
        
    }
    
    
    
}
extension RMCharacterListView :  RMCharacterListViewModelDelegate {
    func didLoadInitialCharacters() {
        self.spinner.stopAnimating()
        self.collectionView.isHidden = false
        collectionView.reloadData()
        UIView.animate(withDuration: 0.4) {
            self.collectionView.alpha = 1
        }
    }
}
