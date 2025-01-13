//
//  MovieRankingCollectionViewCell.swift
//  UIWithCode
//
//  Created by 박준우 on 1/14/25.
//

import UIKit
import SnapKit

class MovieRankingCollectionViewCell: UICollectionViewCell {

    static let id = "MovieRankingCollectionViewCell"
    
    let rankLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()
    
    let dateLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(rankLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLable)
        
        rankLabel.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.leading.verticalEdges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(rankLabel.snp.trailing).offset(16)
            make.verticalEdges.equalToSuperview().inset(4)
        }
        
        dateLable.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).inset(16)
            make.verticalEdges.equalToSuperview().inset(4)
            make.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
