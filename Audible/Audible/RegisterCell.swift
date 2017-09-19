//
//  ReqisterCell.swift
//  Audible
//
//  Created by ebrahim hassan on 9/8/17.
//  Copyright © 2017 ebrahim hassan. All rights reserved.
//

import UIKit
class RegisterCell :UICollectionViewCell{
    
    let logoImage : UIImageView = {
        let img = UIImage(named: "logo")
        let imgv = UIImageView(image: img)
        return imgv
    
    }()
    
    let emailText:leftPaddedTextField = {
        let TF = leftPaddedTextField()
        TF.placeholder = "Enter Your email"
        TF.layer.borderColor = UIColor.lightGray.cgColor
        TF.layer.borderWidth = 1
        TF.keyboardType = .emailAddress
        return TF
    }()
    let PassText:leftPaddedTextField = {
        let TF = leftPaddedTextField()
        TF.placeholder = "Enter Your Password"
        TF.layer.borderColor = UIColor.lightGray.cgColor
        TF.layer.borderWidth = 1
        TF.isSecureTextEntry=true
        return TF
    }()
    lazy var loginButton:UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("log in ", for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.loginHandling), for: .touchUpInside)
        return button
    }()
    //var loginController : LoginViewController?
    var delegate : LoginControllDeleget?
    func loginHandling(){
        delegate?.LoginFinished()
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = .white
        addSubview(logoImage)
        addSubview(emailText)
        addSubview(PassText)
        addSubview(loginButton)
        
        var topconstForImg = self.frame.height / 3  * -1
        var topAncImg = centerYAnchor
        if( UIDevice.current.orientation.isLandscape){
            topconstForImg = 0;topAncImg = topAnchor
        }
        logoImage.anchor(topAncImg, left: nil, bottom: nil, right: nil, topConstant: topconstForImg, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
        logoImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive=true
        
        emailText.anchor(logoImage.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 32, leftConstant: 32 , bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 40)
        PassText.anchor(emailText.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32 , bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 40)
        loginButton.anchor(PassText.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16 , leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 40)
        
        let tapper = UITapGestureRecognizer(target: self, action:#selector(endEditingKeyboard))
        tapper.cancelsTouchesInView = false
        self.addGestureRecognizer(tapper)
    }
    
    func endEditingKeyboard(){
        self.endEditing(true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class leftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y , width: bounds.width - 5 , height: bounds.height)
        
    }
    
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
         return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y , width: bounds.width - 5 , height: bounds.height)
    }
    
}









