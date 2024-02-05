//
//  CWButton.swift
//  CardWorkout
//
//  Created by SushantNeupane on 2/5/24.
//

import UIKit

class CWButton: UIButton {
    
    override init(frame : CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor : UIColor, title : String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }
    
    func configure(){
        titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel?.textColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 16
    }
}
