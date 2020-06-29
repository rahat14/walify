//
//  ViewController.swift
 //  walify
//
//  Created by rahat shovo  on 22/4/20.
//  Copyright © 2020 rahat shovo . All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    let kResponsiveCollectionViewCellIdentifier = "catgoryCell"
       let kResponsiveCollectionViewCellImageTag = 1
       let kResponsiveCollectionSizeProportion = 1.0 // width/height (equal in this case)
       let kReadyCategoryCollectionViewCellSpanRegular = 40.0
       let kReadyCategoryCollectionViewCellSpanCompact = 20.0
    
    @IBOutlet weak var catgoryList: UICollectionView!
    @IBOutlet weak var navBar: UINavigationItem!
    let imageArray :[UIImage] = [#imageLiteral(resourceName: "sunset") , #imageLiteral(resourceName: "forest") , #imageLiteral(resourceName: "lake")  , #imageLiteral(resourceName: "car") , #imageLiteral(resourceName: "landscape")]
    let catgoray = [ "Sunset" , "Forest" , "Lake" , "Car" , "Landscape"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
 
        self.navBar.title = "Walify"
        catgoryList.dataSource = self
        catgoryList.delegate = self


        let layout  = self.catgoryList.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0,left: 25,bottom: 0,right: 25)
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: (self.catgoryList.frame.size.width - 20)/2 , height: self.catgoryList.frame.size.height/3)
}
    
    
    ///gmafg madlglmadg kmladmfgadfg
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          
        
        return catgoray.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
        
        let cell = catgoryList.dequeueReusableCell(withReuseIdentifier: "catgoryCell", for: indexPath) as! CatgoryCollectionViewCell
    
        cell.imageView.clipsToBounds = true
       cell.imageView.image = imageArray[indexPath.row]
       
       cell.name.text = catgoray[indexPath.row]
//        cell.imageView.layer.cornerRadius = 12
        return cell
       }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
     //   catgoray[indexPath.row]
        
        
     //   let mainStory: UIStoryboard  = UIStoryboard(name: "Main", bundle: nil)
        let descVc = storyboard?.instantiateViewController(withIdentifier: "WallPaperViewController") as! WallPaperViewController
        
        descVc.name = catgoray[indexPath.row]
        //descVc.catgo
        self.navigationController?.pushViewController(descVc,animated:  true)
        
        
        
        
    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if(segue.identifier == "cellClick")
//        {
//            let destination = segue.destination as! AllWallPaperViewController
//            let todo = catgoray[catgoryList.didSele.row]
//            destination.catgoryName = todo
//        }
//
//    }
    
    
    
    
    
  
       


}

