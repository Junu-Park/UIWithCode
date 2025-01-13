//
//  NpayViewController.swift
//  UIWithCode
//
//  Created by 박준우 on 1/13/25.
//

import UIKit

class NpayViewController: UIViewController {
    
    let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["멤버십", "현장결제", "쿠폰"])
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.lightGray], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.selectedSegmentTintColor = UIColor.lightGray
        segmentedControl.backgroundColor = UIColor.black
        return segmentedControl
    }()
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var xButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor.black
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let npayLabel: UILabel = {
       let label = UILabel()
        label.text = "🅝pay"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    let popUpButton: UIButton = {
        let button = UIButton()
        let menu1 = UIAction(title: "국내", handler: {_ in })
        let menu2 = UIAction(title: "국외", handler: {_ in })
        button.configuration = .plain()
        button.changesSelectionAsPrimaryAction = true
        button.showsMenuAsPrimaryAction = true
        button.menu = .init(children: [menu1, menu2])
        button.tintColor = UIColor.lightGray
        button.setTitleColor(UIColor.lightGray, for: .normal)
        return button
    }()
    
    let lockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lock.fill")
        imageView.tintColor = UIColor.green
        return imageView
    }()
    
    let explainLabel: UILabel = {
        let label = UILabel()
        label.text = "한 번만 인증하고\n비밀번호 없이 결제하세요"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let paymentCheckButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor.green
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        button.setTitle("바로결제 사용하기", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.configuration?.imagePadding = 16
        return button
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 20
        button.setTitle("확인", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.85)
        configureAddSubview()
        configureLayout()
    }
    
    func configureAddSubview() {
        view.addSubview(segmentedControl)
        view.addSubview(mainView)
        mainView.addSubview(xButton)
        mainView.addSubview(npayLabel)
        mainView.addSubview(popUpButton)
        mainView.addSubview(lockImageView)
        mainView.addSubview(explainLabel)
        mainView.addSubview(paymentCheckButton)
        mainView.addSubview(confirmButton)
    }
    
    func configureLayout() {
        segmentedControl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.horizontalEdges.equalToSuperview().inset(32)
        }
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(32)
        }
        
        xButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        npayLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
        }
        
        popUpButton.snp.makeConstraints { make in
            make.height.equalTo(50)

            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(npayLabel.snp.trailing).offset(8)
        }
        
        lockImageView.snp.makeConstraints { make in
            make.top.equalTo(popUpButton.snp.bottom).offset(32)
            make.horizontalEdges.equalToSuperview().inset(64)
            make.height.equalTo(200)
        }
        
        explainLabel.snp.makeConstraints { make in
            make.top.equalTo(lockImageView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(32)
        }
        
        paymentCheckButton.snp.makeConstraints { make in
            make.top.equalTo(explainLabel.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(32)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.top.equalTo(paymentCheckButton.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    @objc func buttonTapped() {
        dismiss(animated: true)
    }
}
