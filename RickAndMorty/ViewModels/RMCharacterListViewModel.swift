//
//  RMCharacterListViewModel.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/3/23.
//

import UIKit
protocol RMCharacterListViewModelDelegate : AnyObject {
    func didLoadInitialCharacters()
}

final class RMCharacterListViewModel : NSObject  {
    public weak var delegate : RMCharacterListViewModelDelegate?
    private var characters : [RMCharacter] = [] {
        didSet {
            for character in characters {
                let viewModel = RMCharecterCollectionViewCellViewModel(characterName: character.name, characterStatus: character.status, characterGender: character.gender, characterImageUrl: URL(string:character.image))
                cellViewModels.append(viewModel)
            }
        }
    }
    private var info : Info?
    private var cellViewModels : [RMCharecterCollectionViewCellViewModel] = []
    
    func fetchAllCharaters(){
        RMService.shared.execute(.chatacterListRequest, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let res):
                let results  = res.results
                self.characters = results
                let info = res.info
                self.info = info
                DispatchQueue.main.async {
                    self.delegate?.didLoadInitialCharacters()
                }
                
            case .failure(let err):
                print(String(describing: err))
            }
        }
        
    }
}

extension RMCharacterListViewModel :  UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharecterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharecterCollectionViewCell else { fatalError("Unsupported cell")}
        let viewModel = cellViewModels[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width , height: width * 1.5)
    }
    
}


