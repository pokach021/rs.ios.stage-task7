//
//  RSSecretButton.swift
//  rs.ios-stage.task-7-swift
//
//  Created by Andrew Pokachailo on 7/9/21.
//

import UIKit

class RSSecretButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customInit()
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.littleBoyBlue.withAlphaComponent(0.2) : .white
        }
    }
    
    func customInit() {
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.littleBoyBlue.cgColor
        self.setTitleColor(UIColor.littleBoyBlue, for: .normal)
        self.layer.cornerRadius = self.bounds.height / 2
    }
        

}
