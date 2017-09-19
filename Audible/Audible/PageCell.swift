//
//  PageCell.swift
//  Audible
//
//  Created by ebrahim hassan on 9/7/17.
//  Copyright © 2017 ebrahim hassan. All rights reserved.
//

import UIKit
class PageCell: UICollectionViewCell {
    var page:Page? {
        didSet{
            guard let page = page else{return}
            var pgName = page.imageName
            if (UIDevice.current.orientation.isLandscape){
                pgName += "_landscape"
            }
            imgView.image=UIImage(named: pgName)
      //      textview.text = page.title + "\n\n"+page.message
            let attributedtext=NSMutableAttributedString(string: page.title, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 18, weight: UIFontWeightMedium),NSForegroundColorAttributeName:UIColor(white: 0.2, alpha: 1)])
            attributedtext.append(
                NSMutableAttributedString(string: "\n\n \(page.message)", attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular),NSForegroundColorAttributeName:UIColor(white:0.2,alpha:1)])
            )
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = .center
            attributedtext.addAttribute(NSParagraphStyleAttributeName, value: paragraph, range: NSRange(location: 0, length: attributedtext.string.characters.count)
                )
            textview.attributedText=attributedtext
                    }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    let imgView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.image = UIImage(named: "page1")
        return iv
    }()
    let linesperator:UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return v
    }()
    let textview:UITextView = {
        let tv = UITextView()
        tv.text="SImple Text For Now"
        tv.textColor = .black
        tv.backgroundColor = .white
        tv.adjustsFontForContentSizeCategory=true
        tv.textAlignment = .center
        tv.isEditable=false
        tv.textContainerInset = UIEdgeInsetsMake(24, 16, 0, 16)
        return tv
    }()
    func setupView(){
       // backgroundColor = .blue
        self.contentMode = .scaleToFill
        self.addSubview(imgView)
        self.addSubview(linesperator)
        self.addSubview(textview)
        
        
        
        self.imgView.anchorToTop(topAnchor, left: leftAnchor, bottom: linesperator.topAnchor, right: rightAnchor)
        
        linesperator.anchorToTop(imgView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
      //  textview.anchorToTop(linesperator.topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        textview.anchor(linesperator.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: -1, leftConstant: 0, bottomConstant: -1, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        textview.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive=true
        linesperator.heightAnchor.constraint(equalToConstant: 1 ).isActive=true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
