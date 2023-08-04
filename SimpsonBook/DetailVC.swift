//
//  DetailVC.swift
//  SimpsonBook
//
//  Created by Şeyda Aydın on 8.06.2023.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    var selectedSimpson : Simpson?
    var url = URL(string: String())
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        nameLabel.isUserInteractionEnabled = true
        
        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.imageView
        
        
        
        
        nameLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelTapped)))
        
        
        linkLabel()
        
        
        
        
    }
    @objc func labelTapped()
    {
 
        if let url = URL(string: "https://tr.wikipedia.org/wiki/\(nameLabel.text!.replacingOccurrences(of: " ", with: "_"))") {
        
            
            UIApplication.shared.open(url)
            
            
            
            
            
            
        }
        
    }
    
    func linkLabel()
    {
        let attributedString = NSMutableAttributedString(string:"\(nameLabel.text!)")
        let range = NSRange(location: 0, length: attributedString.length)
      
        url = URL(string: "https://tr.wikipedia.org/wiki/\(nameLabel.text!.replacingOccurrences(of: " ", with: "_"))")
        
        attributedString.addAttribute(.link, value: url, range: range)
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: range)
        nameLabel.attributedText = attributedString
        
        
    }
    
    
    
    
    
    
    
    
    
}
