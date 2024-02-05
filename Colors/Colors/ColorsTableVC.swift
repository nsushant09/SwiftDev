//
//  ColorsTableVCViewController.swift
//  Colors
//
//  Created by SushantNeupane on 2/4/24.
//

import UIKit

class ColorsTableVC: UIViewController{
    
    var colors : [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateColors()
    }
    
    func generateColors(){
        for _ in 0..<50{
            colors.append(createRandomColor())
        }
    }
    
    func createRandomColor() -> UIColor{
        let randomColor = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: CGFloat.random(in: 0...1)
        )
        return randomColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailVC
        let color = sender as? UIColor
        destVC.color = color
    }
}

extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returns number of rows in the tableview
        return colors.count;
    }
    
    // delegate method : automatic method waiting for actions completion to be called
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //position is indexPath.row
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else {return UITableViewCell();}
        let color = colors[indexPath.row]
        cell.backgroundColor = color
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: "ToColorDetailVC", sender: color)
    }
}
