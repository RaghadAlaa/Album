//
//  ViewController.swift
//  Album
//
//  Created by jaafar zubaidi on 6/2/22.
//

import UIKit

class ViewController: UIViewController , viewModelprotocol {
    var error :Error?
    
    
    var vm = AlbumViewModel()
    

    @IBOutlet weak var tbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.delegate = self
        vm.getDatafromApiHandler()
    }
    func didfinish() {
        if error == nil {
            DispatchQueue.main.async {
                self.tbl.reloadData()
            }
        }}

}
extension ViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        let item  = vm.Array[indexPath.row]
        
        imageloader.shared.getimage(url: item.thumbnailUrl, complition: {
            image  in
            DispatchQueue.main.async {
                cell.img.image = image
                
            }
        })
        
        return cell
    }
    
    
}

