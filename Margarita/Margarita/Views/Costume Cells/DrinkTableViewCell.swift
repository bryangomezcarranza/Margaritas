//
//  DrinkTableViewCell.swift
//  Margarita
//
//  Created by Bryan Gomez on 8/4/21.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var drinkNameTextLabel: UILabel!
    
    var margarita: Margarita? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        guard let margarita = margarita else { return }
        self.drinkNameTextLabel.text = margarita.strDrink
        
        DrinkController.fetchThumbnail(thumbnail: margarita.strDrinkThumb) { result in
            DispatchQueue.main.async {
                switch result {
                case .success( let thumbnail):
                    self.thumbnailImageView.image = thumbnail
                    self.thumbnailImageView.contentMode = .scaleAspectFill
                case .failure(_):
                    self.thumbnailImageView.image = UIImage(named: "comingSoon")
                    self.thumbnailImageView.contentMode = .scaleAspectFill
                }
            }
        }
    }
}
