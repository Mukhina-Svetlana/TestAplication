//
//  ViewController.swift
//  TestTask
//
//  Created by Светлана Мухина on 30.03.2022.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    private let networkManager = NetworkManager()
    private var arrayName = [String]()
    private let cellID = "MyCell"
    
    lazy private var layout: UICollectionViewFlowLayout = {
        let layout = MyLeftCustomFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }()
    
    lazy private var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.dataSource = self
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        fetchData()
        configuration()
   }
}
extension ViewController {
    
    private func configuration() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func fetchData() {
        networkManager.fetchFilms(completionHandled: { model in
            for i in model{
                self.arrayName.append(i.name)
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CustomCollectionViewCell else {return UICollectionViewCell()}
        cell.textForEachCell(label: arrayName[indexPath.row])
        return cell
    }
}

