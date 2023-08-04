//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Şeyda Aydın on 8.06.2023.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
   
    
    var simpsonArray = [Simpson]()
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
       
        
    //Simpson Object
        
        let homer = Simpson(imageView: UIImage(named: "homer")!, nameLabel: "Homer Simpson", jobLabel: "Nuclear Safety")
        
        let marge = Simpson(imageView: UIImage(named: "marge")!, nameLabel: "Marge Simpson", jobLabel: "Housewife")
        
        let lisa = Simpson(imageView: UIImage(named: "lisa")!, nameLabel: "Lisa Simpson", jobLabel: "Student")
        
        let bart = Simpson(imageView: UIImage(named: "bart")!, nameLabel: "Bart Simpson", jobLabel: "Student")
        
        let maggie = Simpson(imageView: UIImage(named: "maggie")!, nameLabel: "Maggie Simpson", jobLabel: "Baby")
        
        simpsonArray.append(homer)
        simpsonArray.append(marge)
        simpsonArray.append(lisa)
        simpsonArray.append(bart)
        simpsonArray.append(maggie)
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return simpsonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = simpsonArray[indexPath.row].name
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsonArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "toDetailVC" {
            
            var destination = segue.destination as! DetailVC
            destination.selectedSimpson = chosenSimpson
        }
    }
    
 


}

