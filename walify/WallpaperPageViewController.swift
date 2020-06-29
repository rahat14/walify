//
//  WallpaperPageViewController.swift
//  walify
//
//  Created by rahat shovo  on 24/4/20.
//  Copyright © 2020 rahat shovo . All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
import Toast_Swift

class WallpaperPageViewController: UIViewController {
    
    @IBOutlet weak var wallView: UIImageView!
    @IBOutlet weak var dwnldBtn: UIButton!
    var ImageLink : String = ""
    var lowImage: String = ""
    var downloadedImage : UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

    
        dwnldBtn.layer.cornerRadius = 12
  
        
        
        loadImage()
        
        
    }
    
    
    @IBAction func DwldBtnPressed(_ sender: Any) {
        
        
          UIImageWriteToSavedPhotosAlbum(downloadedImage, self, #selector(self.savedImage), nil)
//
//       let downloader = ImageDownloader()
//        let urlRequest = URLRequest(url: URL(string: ImageLink)!)
//
//
//        downloader.download(urlRequest) { response in
//           // print(response.request)
//          //  print(response.response)
//            debugPrint(response.result)
//
//            if case .success( _) = response.result {
//                print("image downlaoded ")
//
//                let documentsDirectory = FileManager.SearchPathDirectory.documentDirectory
//                let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
//                let paths = NSSearchPathForDirectoriesInDomains(documentsDirectory, userDomainMask, true)
//
//                if paths.first != nil {
//                    if let directoryURL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)[0] as? URL {
//
//                            let fileName = response.response?.suggestedFilename // get your file name here.
//                            let finalPath = directoryURL.appendingPathComponent(fileName!) //get your file path here
//
//                                print(finalPath)
//
//                    }
//                    else
//                    {
//
//                    }
//
//
//                }
//
//            }
//        }
//
//
//

        
}
    
    func loadImage() {
        
        
         AF.request(ImageLink).responseImage { response in
         //debugPrint(response)

         if case .success(let image) = response.result {
            // print("image downloaded: \(image)")
             
             DispatchQueue.main.async {
                 
                self.wallView.image = image
                
                self.downloadedImage = image
              
             }
         }
             
         else {
            self.wallView.image = nil
             }
        
    }

    

    
}
    
    @objc func savedImage(_ im:UIImage, error:Error?, context:UnsafeMutableRawPointer?) {
        if let err = error {
            var style = ToastStyle()

            // this is just one of many style options
            style.messageColor = .white
            self.view.makeToast("Something Went Wrong", duration: 2.0, position: .bottom, style: style)
            print(err)
            return
        }
        
        // create a new style
        var style = ToastStyle()

        // this is just one of many style options
        style.messageColor = .white

        // present the toast with the new style
        self.view.makeToast("Wallpaper Saved !!", duration: 1.0, position: .bottom, style: style)

        // or perhaps you want to use this style for all toasts going forward?
        // just set the shared style and there's no need to provide the style again
       // ToastManager.shared.style = style
       // self.view.makeToast("This is a piece of toast") // now uses the shared style

        // toggle "tap to dismiss" functionality
        ToastManager.shared.isTapToDismissEnabled = false

        // toggle queueing behavior
        ToastManager.shared.isQueueEnabled = true
       //print("success")
    }

}

//extension  wallView! :  UIImageView{
//
//func saveImage(inDir:FileManager.SearchPathDirectory,name:String){
//    guard let documentDirectoryPath = FileManager.default.urls(for: inDir, in: .userDomainMask).first else {
//        return
//    }
//    let img = UIImage(named: "\(name).jpg")!
//
//    // Change extension if you want to save as PNG.
//    let imgPath = URL(fileURLWithPath: documentDirectoryPath.appendingPathComponent("\(name).jpg").absoluteString)
//    do {
//        try img.jpegData(compressionQuality: 1.00)?.write(to: imgPath, options: .atomic)
//    } catch {
//        print(error.localizedDescription)
//    }
//  }
//}
