//
//  File.swift
//  Album
//
//  Created by jaafar zubaidi on 6/2/22.
//

import Foundation
class AlbumViewModel : Apihandlerprotocol {
   
    var error : Error?
    var Array = [PhotoModel]()
    var delegate : viewModelprotocol?
    
    func getDatafromApiHandler (){
        ApiHandel.shared.delegate = self
        ApiHandel.shared.getData()
    }
    
    func didfinish(data: Data?, responed: URLResponse, error: Error?) {
        self.error = error
        if data != nil {
            do {self.Array = try JSONDecoder().decode([PhotoModel].self, from: data!)
                self.delegate?.didfinish()
            }
            catch{
                print (self.error?.localizedDescription)
            }
            
        }
    }
    
}
protocol viewModelprotocol {
    func didfinish()
}

