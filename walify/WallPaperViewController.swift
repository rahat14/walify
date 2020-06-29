//
//  WallPaperViewController.swift
//  walify
//
//  Created by rahat shovo  on 23/4/20.
//  Copyright © 2020 rahat shovo . All rights reserved.
//

import UIKit
import CollectionViewGridLayout
import  Alamofire
import AlamofireImage
import  SwiftyJSON

class WallPaperViewController: UIViewController  {


   
    @IBOutlet weak var collectionView: UICollectionView!

    var collectionViewFlowLayout : UICollectionViewFlowLayout!
 public  var imageList = [ImageRe]()
    var estimateWidth = 300.0
    var cellMarginSize = 16.0
      let imageArray :[UIImage] = [#imageLiteral(resourceName: "sunset") , #imageLiteral(resourceName: "forest") , #imageLiteral(resourceName: "lake")  , #imageLiteral(resourceName: "car") , #imageLiteral(resourceName: "landscape")]
    var name : String = ""
     let cellIdentifier = "WallpaperViewCell"
    let layout =  CollectionViewVerticalGridLayout()
    override func viewDidLoad() {
        super.viewDidLoad()

     
        setUPCollectionView()
        //print(name)
        LoadWallpaper()
        
       
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        setupCollectionViewItemSize()
        
    }
    
    
    private func setUPCollectionView()
    {
         collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "WallpaperViewCell" , bundle: nil )
        collectionView.register(nib   , forCellWithReuseIdentifier: cellIdentifier)
        
    
        
    }
    private func setupCollectionViewItemSize() {
       
//        if(collectionViewFlowLayout == nil)
//        {
//            let numberPErRow : CGFloat = 2
//            let linSPacing: CGFloat = 2
//            let INterItemSPace : CGFloat = 2
//
//            let width = (collectionView.frame.width - (numberPErRow) * INterItemSPace) / numberPErRow
//
//            let height : CGFloat = width
//
//            collectionViewFlowLayout = UICollectionViewFlowLayout()
//            collectionViewFlowLayout.itemSize = CGSize (width: width, height: height)
//            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0,left: 2,bottom: 0,right: 2)
//            collectionViewFlowLayout.scrollDirection = .vertical
//            collectionViewFlowLayout.minimumInteritemSpacing =  INterItemSPace
//            collectionViewFlowLayout.minimumLineSpacing = linSPacing
//
//
//            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
//
//
//        }
        
        
//        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
//       // flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
//        //flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
//       flow.sectionInset = UIEdgeInsets(top: 0,left: 5,bottom: 0,right: 5)
     }
    
   
    
    private func LoadWallpaper(){
        
        let Url = "https://pixabay.com/api/?key=16208034-0f8e1867a052b62c265189df4&orientation=vertical&min_width=1920&min_height=1080image_type=photo&per_page=20&order=popular&q=" + self.name
         
        
        AF.request(Url ,method:  .get).validate().responseJSON{ (response) in
            switch response.result{
            case .success( _):
                let   json  = try?  JSON(data: response.data!)
                let reultarray = json!["hits"]
                for  i  in reultarray.arrayValue{
                    self.imageList.append(ImageRe (json : i))
                    
                    
                }
                
              //now call the table view to show our data
                
                
                DispatchQueue.main.async {
                    
                                   self.collectionView.reloadData()
                                   //SVProgressHUD.dismiss()
                                   
                               }
                
            
            case.failure(let Error):
                print(Error)
                
            }
        }
        
        
    }
}



extension WallPaperViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return imageList.count
     }
    
    
     

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! WallpaperViewCell
       
        cell.image.image = nil
        // set image here
        
        
        
        AF.request(imageList[indexPath.row].webformatURL!).responseImage { response in
        //debugPrint(response)

        if case .success(let image) = response.result {
           // print("image downloaded: \(image)")
            
            DispatchQueue.main.async {
                
                cell.image?.image = image
            }
        }
            
        else {
            cell.image.image = self.imageArray[0]
            }
            
            
            
            
}
            
            
       return cell
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, numberOfColumnsForSection section: Int) -> Int {
              return 2
          }
    
   
    
  
    
    func collectionView(_ collectionView: UICollectionView,
                                         layout collectionViewLayout: UICollectionViewLayout,
                                         rowSpacingForSection section: Int) -> CGFloat
    {
        
        return 10
    }

 func collectionView(_ collectionView: UICollectionView,
                                         layout collectionViewLayout: UICollectionViewLayout,
                                         columnSpacingForSection section: Int) -> CGFloat
 {
    
    return 15
    }
    

    
    
    

    

    
}

extension WallPaperViewController : CollectionViewDelegateVerticalGridLayout
{
    
   
  
    func collectionView(_ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    heightForItemAt indexPath: IndexPath,
    columnWidth: CGFloat) -> CGFloat
    {
        return 220
    }
    func collectionView(_ collectionView: UICollectionView,
       layout collectionViewLayout: UICollectionViewLayout,
       heightForItemAt indexPath: IndexPath,
       columnHeight: CGFloat) -> CGFloat
       {
           return 50
       }
    func collectionView(_ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    heightForHeaderInSection section: Int) -> CGFloat
    {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSection section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
     }
    
    
    
    
    
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
           
        //   catgoray[indexPath.row]
           
           
        //   let mainStory: UIStoryboard  = UIStoryboard(name: "Main", bundle: nil)
           let descVc = storyboard?.instantiateViewController(withIdentifier: "WallpaperPageViewController") as! WallpaperPageViewController
           
            descVc.ImageLink = self.imageList[indexPath.row].largeImageURL!
            descVc.lowImage = self.imageList[indexPath.row].webformatURL!
           //descVc.catgo
           self.navigationController?.pushViewController(descVc,animated:  true)
           
           
           
           
       }
    
    
    
   
       
}


