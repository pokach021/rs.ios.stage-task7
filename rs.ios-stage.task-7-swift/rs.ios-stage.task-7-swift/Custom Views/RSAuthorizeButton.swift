//
//  RSAuthorizeButton.swift
//  rs.ios-stage.task-7-swift
//
//  Created by Andrew Pokachailo on 7/8/21.
//

import UIKit

@IBDesignable

class RSAuthorizeButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.littleBoyBlue.withAlphaComponent(0.2) : .white
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            self.alpha = !isEnabled ? 0.5 : 1
        }
    }

    func customInit() {
        self.isEnabled = true
        self.setTitleColor(UIColor.littleBoyBlue, for: .normal)
        self.setTitleColor(UIColor.littleBoyBlue.withAlphaComponent(0.4), for: .highlighted)
        self.layer.borderColor = UIColor.littleBoyBlue.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
        self.setImage(UIImage(named: "person"), for: .normal)
        self.setImage(UIImage(named: "person-fill"), for: .highlighted)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 20)
    }
    
    func reset() {
        self.customInit()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
        print("frame init")
    }
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customInit()
        print("coder init")
       
    }
    
}
