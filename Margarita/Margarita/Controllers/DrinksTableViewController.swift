//
//  DrinksTableViewController.swift
//  Margarita
//
//  Created by Bryan Gomez on 8/4/21.
//

import UIKit

class DrinksTableViewController: UITableViewController {
    
    var margarita: [Margarita] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DrinkController.fetchDrink { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let drinks):
                    self.margarita = drinks
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return margarita.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as? DrinkTableViewCell else { return UITableViewCell() }
        let drink = self.margarita[indexPath.row]
        cell.margarita = drink
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? DrinkDetailViewController else { return }
            
            let drinkToPass = margarita[indexPath.row]
            destinationVC.margarita = drinkToPass
        }
    }
    

}
