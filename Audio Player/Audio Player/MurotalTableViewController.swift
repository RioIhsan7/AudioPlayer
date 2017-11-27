//
//  MurotalTableViewController.swift
//  Audio Player
//
//  Created by Rio_Ihsan on 9/22/17.
//  Copyright © 2017 mac os. All rights reserved.
//

import UIKit

class MurotalTableViewController: UITableViewController {
    //deklarasi variabel murotal
    var murotal = Murotal().library

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return murotal.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MurotalTableViewCell
        
        cell.artist.text = murotal[indexPath.row]["artist"] as! String
        cell.title.text = murotal[indexPath.row]["title"] as! String
        if let coverImage = murotal[indexPath.row]["coverImage"] {
            cell.coverImage.image = UIImage(named: "\(coverImage).png")
        }

        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "segue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let playerVC = segue.destination as! MurotalViewController
            let indexPath = tableView.indexPathForSelectedRow!
            playerVC.trackId = indexPath.row
        }
    }
}
