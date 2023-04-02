//
//  RMCharacterListViewModel.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/3/23.
//

import UIKit

final class RMCharacterListViewModel : NSObject  {
    
    func fetchAllCharaters(){
        //let request = RMRequest(endPoint: .character,queryParameters: [URLQueryItem(name: "name", value: "rick"),URLQueryItem(name: "status", value: "alive")])
        RMService.shared.execute(.chatacterListRequest, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let res):
                print(String(describing: res))
                print("Total: "+String(res.info.count))
            case .failure(let err):
                print(String(describing: err))
            }
        }
    }
    
}
extension RMCharacterListViewModel : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemPink
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width , height: width * 1.5)
    }
    
}
