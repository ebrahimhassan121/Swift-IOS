//
//  ViewController.swift
//  Audible
//
//  Created by ebrahim hassan on 9/7/17.
//  Copyright © 2017 ebrahim hassan. All rights reserved.
//

import UIKit
protocol LoginControllDeleget {
   func LoginFinished()
}
class LoginViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate , UICollectionViewDelegateFlowLayout,LoginControllDeleget{
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing=0
        let cv = UICollectionView(frame:.zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.orange
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        
        print(self)
        return cv
    }()
    lazy var pageControll:UIPageControl = {
        let pg = UIPageControl()
        pg.numberOfPages = self.pages.count + 1
        pg.currentPageIndicatorTintColor = UIColor.orange
        pg.pageIndicatorTintColor = .lightGray
        
        return pg
    }()
    let skipButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SKIP", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        return button
    }()
    let NextButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        return button
    }()
    
    let cellID = "cellID"
    let requisterID:String="reqisterID"
    var pagecontrollbottomanchor:NSLayoutConstraint?
    var nextbuttontopanchor:NSLayoutConstraint?
    var skipButtonTopAnchor:NSLayoutConstraint?
    var pages : [Page] = {
        let firstpage=Page(imgName: "page1", title: "Share agreat Listen", message: "it's free to send your books to the people in your life .Every reciptient's first book is on us")
          let Secondpage=Page(imgName: "page2", title: "Send from Your Library", message: "the more menu next to any book. Choose\n\"The Send Book \" ")
          let thirdpage=Page(imgName: "page3", title: "Send From The Player", message: "Tap the More menu in the upper corner . Choose\n\"send this Book\" ")
        return [firstpage, Secondpage,thirdpage]
    
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        observeKeyboardNotifications()
        view.addSubview(collectionView)
        view.addSubview(pageControll)
        view.addSubview(skipButton)
        view.addSubview(NextButton)
        collectionView.frame = view.frame
        //use autolayout insteaf
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(RegisterCell.self, forCellWithReuseIdentifier: requisterID)
        pagecontrollbottomanchor = pageControll.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)?[1]
      skipButtonTopAnchor =  skipButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50)?.first
       nextbuttontopanchor = NextButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50)?.first
        pageControll.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControlEvents.valueChanged)
        skipButton.addTarget(self, action: #selector(self.SkipClick(sender:)), for: .touchUpInside)
        NextButton.addTarget(self, action: #selector(self.NextClick(sender:)), for: .touchUpInside)
        
        
    }
   
    fileprivate func observeKeyboardNotifications(){
    
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func showKeyboard(){
        UIView.animate(withDuration: 0.5 , delay: 0, options: .curveEaseOut, animations: {
        self.view.frame = CGRect(x: 0, y: -120, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
        print("Keyboard ")
    
    }
    func hideKeyboard(){
        UIView.animate(withDuration: 0.5 , delay: 0, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
        print("Keyboard ")
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count+1
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNamber = targetContentOffset.pointee.x / view.frame.width
        pageControll.currentPage = Int(pageNamber)
        hideShow(pageNumber: Int(pageNamber))
    }
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControll.currentPage) * view.frame.size.width
       collectionView.setContentOffset(CGPoint(x: x,y :0), animated: true)
        let pageNumber = pageControll.currentPage
        hideShow(pageNumber: pageNumber)
    }
    func SkipClick(sender:AnyObject)->(){
    
        // let x =  CGFloat( pages.count) * view.frame.size.width
      //  collectionView.setContentOffset(CGPoint(x: x,y :0), animated: true)
        let indexpath = IndexPath(item: pages.count, section: 0)
        collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
        pageControll.currentPage = pages.count
        let pageNumber = pageControll.currentPage
        hideShow(pageNumber: pageNumber)

    
    }
    func NextClick(sender:AnyObject){
        
        let x =  CGFloat( pageControll.currentPage + 1 ) * view.frame.size.width
        collectionView.setContentOffset(CGPoint(x: x,y :0), animated: true)
        pageControll.currentPage = pageControll.currentPage + 1
        hideShow(pageNumber: pageControll.currentPage)
        
        
        
    }
    func hideShow(pageNumber:Int){
        
        if(pageNumber == pages.count){
            pagecontrollbottomanchor?.constant = 40
            nextbuttontopanchor?.constant = -40
            skipButtonTopAnchor?.constant = -40
        }else{
            pagecontrollbottomanchor?.constant = collectionView.bottomAnchor.accessibilityActivationPoint.y
            nextbuttontopanchor?.constant = 16
            skipButtonTopAnchor?.constant = 16
        }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut , animations: { self.view.layoutIfNeeded() }, completion: nil)
    
    
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               if(indexPath.row==pages.count){
                let cell=collectionView.dequeueReusableCell(withReuseIdentifier:requisterID , for: indexPath) as! RegisterCell
             //   cell.lig=self
                cell.delegate=self
                return cell
        }else{
                let cell=collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PageCell
                
                let page:Page = pages[indexPath.row]
                cell.page=page
                //  cell.backgroundColor = .white
                return cell
                

        
        }
    }
    func LoginFinished(){
        let rootVirwController = UIApplication.shared.keyWindow?.rootViewController
        guard let mainNavigationController = rootVirwController as? MainNavigationController else{return}
        mainNavigationController.viewControllers = [HomeController()]
        UserDefaults.standard.set(true, forKey: "IsLoginIN")
        UserDefaults.standard.synchronize()
       dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
        let indexPath = IndexPath(item: pageControll.currentPage , section: 0)
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.collectionView.reloadData()
        }
    }
    
}



