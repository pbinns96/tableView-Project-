//
//  ViewController.swift
//  tableView
//
//  Created by Payton Binns on 4/2/19.
//  Copyright © 2019 Payton Binns. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var booksLoaded = false
    var booksOrMovies = 1
    
    var dataForBooks: [String] = ["Book"]
    var dataForMovies: [String] = ["Star Wars", "Star Trek", "Star Destroyer", "Star is Born", "Star Power"]

    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myCustomTableView: UITableView!
    @IBOutlet weak var appendMovieTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        myCustomTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
     //First one, this is setting the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {if booksLoaded == false {
        return dataForMovies.count
        }
        if booksLoaded == true {
            return dataForBooks.count
        }
        else {return 0}
    }
    //Second one, this is filling the rows with content
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let myCell = tableView.dequeueReusableCell(withIdentifier: "cellInTableView")
        if booksLoaded == false {
            let holderText = dataForMovies[indexPath.row]
            myCell?.textLabel?.text = holderText
        }
        if booksLoaded == true {
            let holderTextTwo = dataForBooks[indexPath.row]
            myCell?.textLabel?.text = holderTextTwo
        }
        
        return myCell!
    }
    @IBAction func switchButtonPressed(_ sender: UIButton) {
        switch booksOrMovies {
        case 1:
            booksLoaded = true
            booksOrMovies += 1
            myCustomTableView.reloadData()
            titleLabel.text = "Favorite Books"
             sender.setTitle("Switch to Movies", for: [])
            
        case 2:
            booksLoaded = false
            booksOrMovies -= 1
            myCustomTableView.reloadData()
            titleLabel.text = "Favorite Movies"
            sender.setTitle("Switch to Books", for: [])
            
        default:
            break
        }
    }
    @IBAction func removeButtonPressed(_ sender: Any) {
        if booksLoaded == false {dataForMovies.removeLast()
            myCustomTableView.reloadData()}
        if booksLoaded == true {
            dataForBooks.removeLast()
            myCustomTableView.reloadData()
        }
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        if booksLoaded == false {
            dataForMovies.append(appendMovieTextField.text ?? "blah")
            myCustomTableView.reloadData()}
        if booksLoaded == true {
            dataForBooks.append(appendMovieTextField.text ?? "blah")
            myCustomTableView.reloadData()
        }
        
    }
    
}

