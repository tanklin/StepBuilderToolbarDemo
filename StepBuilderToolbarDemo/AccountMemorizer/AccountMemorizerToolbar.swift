//
//  RememberAccountToolbar.swift
//  StepBuilderToolbarDemo
//
//  Created by Tank Lin on 2019/1/23.
//  Copyright © 2019 Tank Lin. All rights reserved.
//

import UIKit

class AccountMemorizerToolbar: UIToolbar {
    
    var title: String? {
        didSet {
            if let title = title {
                checkButton.setTitle(" \(title)", for: .normal)
            }
        }
    }
    var isMemorized: Bool = false {
        didSet {
            setButtonSelectionStatus(isMemorized)
        }
    }
    var didTapClosure: ((UIButton) -> Void)?
    
    private let btnCheckOffImage = UIImage(named: "btn_check_off")
    private let btnCheckOnImage = UIImage(named: "btn_check_on")
    
    private lazy var checkButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.labelFontSize)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.addTarget(self, action: #selector(bindCheckButton), for: .touchUpInside)
        return btn
    }()

    override init(frame: CGRect) {
        let _frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50)
        super.init(frame: _frame)
        
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initView()
    }

    fileprivate func initView() {
        //tintColor = .red
        barStyle = .default
        isTranslucent = true
        //isOpaque = true
        sizeToFit()
        
        let checkBtn = UIBarButtonItem(customView: checkButton)
        setItems([checkBtn], animated: true)
        
        bindCheckButton()
    }
    
    @objc fileprivate func bindCheckButton() {
        checkButton.isSelected.toggle()
        self.isMemorized = checkButton.isSelected
        
        self.didTapClosure?(checkButton)
    }
    
    fileprivate func setButtonSelectionStatus(_ selected: Bool) {
        checkButton.isSelected = selected
        let checkImage = selected ? self.btnCheckOnImage : self.btnCheckOffImage
        
        DispatchQueue.main.async {
            self.checkButton.setImage(checkImage, for: .normal)
        }
    }
    
}
