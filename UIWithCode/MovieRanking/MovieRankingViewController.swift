//
//  MovieRankingViewController.swift
//  UIWithCode
//
//  Created by 박준우 on 1/13/25.
//

import UIKit
import SnapKit

class MovieRankingViewController: UIViewController {

    let data = MovieRanking.mockData
    
    let searchView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = UIColor.white
        textField.tintColor = UIColor.white
        return textField
    }()
    
    let searchUnderLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("검색", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 50)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        configureAddSubview()
        configureLayout()
        configureCollectionView()
    }
    
    func configureAddSubview() {
        view.addSubview(searchView)
        searchView.addSubview(searchTextField)
        searchView.addSubview(searchUnderLine)
        searchView.addSubview(searchButton)
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        searchView.snp.makeConstraints { make in
            make.height.equalTo(60)
//            make.top.equalToSuperview().offset(16)
            make.top.horizontalEdges.equalToSuperview().inset(16)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalTo(searchButton.snp.leading).inset(-8)
            make.top.equalToSuperview().inset(8)
        }
        
        searchUnderLine.snp.makeConstraints { make in
            make.height.equalTo(3)
            make.width.equalTo(searchTextField)
            make.top.equalTo(searchTextField.snp.bottom).offset(8)
            make.bottom.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints { make in
            make.width.equalTo(75)
            make.verticalEdges.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(8)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    @objc func buttonTapped() {
        dismiss(animated: true)
    }
}

extension MovieRankingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MovieRankingCollectionViewCell.self, forCellWithReuseIdentifier: MovieRankingCollectionViewCell.id)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieRankingCollectionViewCell.id, for: indexPath) as? MovieRankingCollectionViewCell {
            cell.dateLable.text = data[indexPath.row].date
            cell.rankLabel.text = "\(data[indexPath.row].rank)"
            cell.titleLabel.text = data[indexPath.row].title
            return cell
        } else {
            let cell = MovieRankingCollectionViewCell()
            return cell
        }
    }
}
