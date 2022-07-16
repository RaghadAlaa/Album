//
//  PhotoModel.swift
//  Album
//
//  Created by jaafar zubaidi on 6/2/22.
//

import Foundation
import UIKit
struct PhotoModel : Decodable {
   let thumbnailUrl : String
}
class imageloader {
    static let  shared = imageloader()
    private init (){}
     let imageCashe = NSCache<NSString , UIImage>()
    
    func getimage (url : String?, complition :@escaping (UIImage)-> ()){
        guard let  url = url  else{
           complition (UIImage(named: "defult")!)
            return
        }
        if let cashed = imageCashe.object(forKey: url as NSString){
        complition(cashed)
            return }
        DispatchQueue.global(qos: .background).async {
            if let urlData = URL(string: url){
                do{
                    let data = try Data(contentsOf: urlData)
                    let image = UIImage(data: data)
                    complition(image!)
                }
                catch{
                    print ("error")
                    complition(UIImage(named: "defult")!)
                }
            }else {
                print ("error")
                complition(UIImage(named: "defult")!)
            }
                
        }
        

    }
    
    
    
    
}
