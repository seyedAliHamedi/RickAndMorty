//
//  RMCharacterListViewController.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/3/23.
//

import UIKit

final class RMCharacterListViewController : NSObject , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharecterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharecterCollectionViewCell else { fatalError("Unsupported cell")}
        
        let viewModel = RMCharecterCollectionViewCellViewModel(characterName: "ali", characterStatus: .alive, characterGender: .male, characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width , height: width * 1.5)
    }
    
}
