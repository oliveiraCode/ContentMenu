//
//  ViewController.swift
//  ContentMenu
//
//  Created by Leandro Fernandes De Oliveira on 2019-09-24.
//  Copyright © 2019 Leandro Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewSetup()
    }
    
    private func imageViewSetup(){
        
        imageView.isUserInteractionEnabled = true
        
        let interaction = UIContextMenuInteraction (delegate: self)
        imageView.addInteraction(interaction)
        
    }
    
    private func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { menuElement in
            return self.contextMenu()
        }
        
    }
    
    func contextMenu() -> UIMenu{
        //create UIAction
        let camera = UIAction(title: "Camera", image: UIImage(systemName: "camera.rotate") ) { (action) in
            //TODO something when pressing camera option
            print("Camera pressed")
        }
        
        let share = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { (action) in
            //TODO something when pressing share option
            print("Share pressed")
        }
        
        let editMenu = UIMenu(title: "More options", children: [camera,share])
        
        
        let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash.fill"), attributes: .destructive) { (action) in
            //TODO something when pressing delete option
            print("Delete pressed")
        }
        
        return UIMenu(title: "", children: [editMenu,delete])
    }
}

