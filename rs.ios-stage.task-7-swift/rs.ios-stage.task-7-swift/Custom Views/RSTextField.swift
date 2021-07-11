//
//  RSTextField.swift
//  rs.ios-stage.task-7-swift
//
//  Created by Andrew Pokachailo on 7/9/21.
//

import UIKit

class RSTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customInit()
    }
    
    func customInit() {
        self.text = ""
        self.alpha = 1
        self.isEnabled = true
        self.setStatement(statement: .active)
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = 5
        
    }
    
    func setStatement(statement: Statement) {
        switch statement {
        case .active:
            self.layer.borderColor = UIColor.blackCoral.cgColor
        case .error:
            self.layer.borderColor = UIColor.venetianRed.cgColor
        case .success:
            self.layer.borderColor = UIColor.turquoiseGreen.cgColor
        }
    }
    
    func reset() {
        self.customInit()
    }
    
}
