//
//  NetflixViewController.swift
//  UIWithCode
//
//  Created by 박준우 on 1/13/25.
//

import UIKit
import SnapKit

enum NetflixTextFieldEnum: String, CaseIterable {
    case emailNPhone = "이메일 주소 또는 전화번호"
    case password = "비밀번호"
    case nickname = "닉네임"
    case location = "위치"
    case code = "추천 코드 입력"
}

class NetflixViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UIColor.red
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        label.text = "NETFLIX"
        
        return label
    }()
    
    lazy var textFieldList: [UITextField] = {
        var list: [UITextField] = []
        for type in NetflixTextFieldEnum.allCases {
            let textField = UITextField()
            textField.configureNetflixTextField(type: type)
            textField.addTarget(self, action: #selector (textFieldDidEndOnExit), for: .editingDidEndOnExit)
            list.append(textField)
        }
        return list
    }()
    
    lazy var signUpButton: UIButton = {
        var button: UIButton = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let additionalLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UIColor.white
        label.text = "추가 정보 입력"
        return label
    }()
    
    let additionalSwitch: UISwitch = {
        let addSwitch: UISwitch = UISwitch()
        addSwitch.onTintColor = UIColor.red
        return addSwitch
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        configureAddSubview()
        configureLayout()
    }
    
    func configureAddSubview() {
        view.addSubview(titleLabel)
        textFieldList.forEach { textField in
            view.addSubview(textField)
        }
        view.addSubview(signUpButton)
        view.addSubview(additionalLabel)
        view.addSubview(additionalSwitch)
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.centerX.equalTo(view)
        }
        
        for order in 0..<textFieldList.count {
            textFieldList[order].snp.makeConstraints { make in
                make.height.equalTo(44)
                make.horizontalEdges.equalToSuperview().inset(32)
                if order == 0 {
                    make.top.equalTo(titleLabel).offset(100)
                } else {
                    make.top.equalTo(textFieldList[order - 1].snp.bottom).offset(16)
                }
            }
        }
        
        signUpButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(32)
            make.top.equalTo(textFieldList.last!.snp.bottom).offset(16)
            make.height.equalTo(50)
        }
        
        additionalLabel.snp.makeConstraints { make in
            make.centerY.equalTo(additionalSwitch)
            make.leading.equalToSuperview().inset(32)
        }
        
        additionalSwitch.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(16)
            make.trailing.equalToSuperview().inset(32)
        }
    }
    
    @objc func textFieldDidEndOnExit(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension UITextField {
    func configureNetflixTextField(type: NetflixTextFieldEnum) {
        self.placeholder = type.rawValue
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.gray
        self.attributedPlaceholder = NSAttributedString(string: type.rawValue, attributes: [.foregroundColor: UIColor.white])
        self.textColor = UIColor.white
        self.tintColor = UIColor.white
        self.textAlignment = .center
    }
}
