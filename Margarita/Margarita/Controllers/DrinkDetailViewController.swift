//
//  DrinkDetailViewController.swift
//  Margarita
//
//  Created by Bryan Gomez on 8/4/21.
//

import UIKit

class DrinkDetailViewController: UIViewController {
    
    @IBOutlet weak var drinkTypeTextLabel: UILabel!
    @IBOutlet weak var instructionsTextLabel: UILabel!
    
    var margarita: Margarita?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DrinkController.fetchDrink { result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    guard let margarita = self.margarita else { return }
                    self.drinkTypeTextLabel.text = margarita.strAlcoholic
                    self.instructionsTextLabel.text = margarita.strInstructions
                case .failure(let error):
                    print(error)
                }
            }
        }

    }
//    func updateView(for margarita: Margarita) {
//
//
//    }

}
