//
//  DetailViewController.swift
//  Project1
//
//  Created by Amanda on 3/13/21.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    // the following was added for project 1
    func imageSelected(name: String) {
        imageView.image = NSImage(named: name)
    }
    
}
