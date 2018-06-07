//
//  ViewController.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/3/15.
//  Copyright © 2018年 alltop. All rights reserved.
//

import UIKit
import Alamofire
import ImageSlideshow
import Reachability

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    @IBOutlet weak var HPcollectionView: UICollectionView!
    
    let NetCheck    = Reachability()
    let callMethods = libs()
    
    var getProduct  : product?
    var getCate     : cate?
    
    var cell_label  : Array = ["所有產品"]
    
    var transResult : product?
    
    let alamofireSource = [
        AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!,
        AlamofireSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!,
        AlamofireSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    
    //the number of section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //the number of item
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cell_label.count
    }
    
    //the context of cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HPcell", for: indexPath) as! HPcostumCell
        let bcolor : UIColor = UIColor( red: 0.2, green: 0.2, blue:0.2, alpha: 0.3 )
        let fileUrl = URL(string: "\(globalVar.categImage)\(indexPath.row)/image")
        
        cell.layer.borderColor = bcolor.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 5
        
        cell.HPcellImage.af_setImage(withURL: fileUrl!)
        cell.HPcellLabel.text = self.cell_label[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var filter : String = ""
        
        if indexPath.row == 0 {
            filter = ""
        } else {
            filter = "('public_categ_ids','in',[\(indexPath.row)])"
        }
        transResult = callMethods.getProductData(filter: filter)
        
        performSegue(withIdentifier: "hpToClassify", sender: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let count = globalVar.category?.result.count {
            for index in 0..<count {
                self.cell_label.append((globalVar.category?.result[index].name)!.trimmingCharacters(in: .whitespaces))
            }
        }
        
        slideshow.backgroundColor = UIColor.white
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = PageControlPosition.underScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        slideshow.pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        //optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        
        slideshow.setImageInputs(alamofireSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
        slideshow.addGestureRecognizer(recognizer)
        
        let color1 = UIColor(hex: "FF6700")
        let color2 = UIColor(hex: "8F1500")
        
        let titleString = "口湖漫遊市集"
        let titleMutableString = NSMutableAttributedString(string: titleString)
        titleMutableString.addAttributes([NSAttributedStringKey.foregroundColor: color1, NSAttributedStringKey.font: UIFont(name: "PingFang TC", size: 20)!], range: getRangeOfSubString(subString: "口湖", fromString: titleString))
        titleMutableString.addAttributes([NSAttributedStringKey.foregroundColor: color2, NSAttributedStringKey.font: UIFont(name: "PingFang TC", size: 20)!], range: getRangeOfSubString(subString: "漫遊市集", fromString: titleString))
        
        if let navigationBar = self.navigationController?.navigationBar {
            let frame = CGRect(x: navigationBar.frame.width/2-50, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            
            let label = UILabel(frame: frame)
            label.attributedText = titleMutableString
            
            navigationBar.addSubview(label)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //setup for the time we tapping on image slider to do
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }

    @IBAction func btnLogin(_ sender: UIButton) {
        performSegue(withIdentifier: "login", sender: nil)
    }

    @IBAction func closePopup(segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login" {
            _ = segue.destination as! login
        } else if segue.identifier == "hpToClassify" {
            let controller = segue.destination as! classifyResult
            controller.result = self.transResult
        }    
    }
    
}


extension ViewController {
    func getRangeOfSubString(subString: String, fromString: String) -> NSRange {
        let sampleLinkRange = fromString.range(of: subString)!
        let startPos = fromString.distance(from: fromString.startIndex, to: sampleLinkRange.lowerBound)
        let endPos = fromString.distance(from: fromString.startIndex, to: sampleLinkRange.upperBound)
        let linkRange = NSMakeRange(startPos, endPos - startPos)
        return linkRange
    }
    
}
