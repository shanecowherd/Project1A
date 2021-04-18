//
//  SourceViewController.swift
//  Project1
//
//  Created by Amanda on 3/13/21.
//
// Added to see if source control push makes it to github file
//
// this line added to test git protocol
// and a second line to test git protocol
// and a third attempt to use git

import Cocoa

class SourceViewController: NSViewController,
                            NSTableViewDataSource,
                            NSTableViewDelegate {

    @IBOutlet var tableView: NSTableView!
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get a list of all files in our bundle's resource path
        // the folder name in the bundle is named "Content"
        // it contains a set of jpgs where file names start with "nssl"
        // for example "nssl0049.jpg"
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // loop over each file we found
        for item in items {
            // if this item starts with "nssl' add it to our array
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    // I'm not sure who or how this method gets called.
    // none of my code calls this method
    // So I assume its initialized when a object is created BUT when where?????
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
   
    // In Storyboard used NSTableView with left and right views
    // left view was initially just to show the name of the file.
    // right view shows the image.
    // Currently compiles and runs
    
    // For homework suppose to switch left view
    // from textField only _TO_ image & text Table Cell View
    // done and it compiles and runs
    func tableView(_ tableView: NSTableView, viewFor tableColumn:
                    NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? TableCellViewWithImage else {return nil}
        
        // Here is where the file name is loaded into the text part of the cell view
        vw.label.stringValue = pictures[row]
        
        vw.image.image = NSImage(named: pictures[row])
        
        return vw
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else {return}
        guard let splitVC = parent as? NSSplitViewController else {return}
        if let detail = splitVC.children[1] as? DetailViewController
        {
            detail.imageSelected(name: pictures[tableView.selectedRow])
        }
    }
    
}
