//
//  RSSecretView.swift
//  rs.ios-stage.task-7-swift
//
//  Created by Andrew Pokachailo on 7/9/21.
//

import UIKit

class RSSecretView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customInit()
    }
    
    func setStatement(statement: Statement) {
        switch statement {
        case .active:
            self.layer.borderColor = UIColor.white.cgColor
        case .error:
            self.layer.borderColor = UIColor.venetianRed.cgColor
        case .success:
            self.layer.borderColor = UIColor.turquoiseGreen.cgColor
            
        }
    }
    
    func customInit() {
        self.isHidden = true
        self.setStatement(statement: .active)
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
    }
    
    func reset() {
        self.customInit()
    }
    
}
