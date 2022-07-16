//
//  File.swift
//  Album
//
//  Created by jaafar zubaidi on 6/2/22.
//

import Foundation
import UIKit
class ApiHandel {
   static let shared = ApiHandel()
    private init (){}
    
    var delegate : Apihandlerprotocol?
    func getData (){
        guard let url = URL.init(string:"https://jsonplaceholder.typicode.com/photos")  else {return}
       
        URLSession.shared.dataTask(with: url, completionHandler: {data ,respond , error in
            self.delegate?.didfinish(data: data, responed: respond!, error: error)
        }).resume()
                                   }
                                   }
       
                                   
                                   
protocol Apihandlerprotocol {
        func didfinish (data : Data? , responed : URLResponse , error :Error?)
        }
                                
