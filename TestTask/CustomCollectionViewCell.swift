//
//  CustomCollectionViewCell.swift
//  TestTask
//
//  Created by Светлана Мухина on 30.03.2022.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    lazy private var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textForEachCell(label: String){
        self.button.setTitle("  \(label)  ", for: .normal)
    }
    
}
extension CustomCollectionViewCell {
    
    private func configuration() {
        addSubview(button)
        button.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc
    private func changeColor() {
        button.backgroundColor = nil
        button.layoutIfNeeded()
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = button.frame.size
        gradientLayer.cornerRadius = 10
        gradientLayer.masksToBounds = false
        gradientLayer.colors =
        [UIColor(red: 1, green: 83/255, blue: 108/255, alpha: 1).cgColor, UIColor(red: 252/255, green: 86/255, blue: 248/255, alpha: 1).cgColor]
        button.layer.insertSublayer(gradientLayer, at: 0)
        button.setTitleColor(.white, for: .normal)
    }
   
}
