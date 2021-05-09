//
//  RaMViewController.swift
//  RaMAPI
//
//  Created by JJB on 5/5/21.
//

import UIKit

class RaMViewController: UIViewController {
    
    
    //MARK: - Outlets
    @IBOutlet weak var characterNameDisplayLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - Properties
    var character: CharacterResults?
    
    
    //MARK: - Actions
    @IBAction func characterButtonTapped(_ sender: Any) {
        
        RaMController.fetchCharacter { [weak self] (result) in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let character):
                    self?.fetchImageAndUpdateViews(for: character)
                
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    
    //MARK: - Helper Functions
    func fetchImageAndUpdateViews(for character: CharacterResults) {
        
        RaMController.fetchImage(for: character) { [weak self] result in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let image):
                    self?.characterImageView.image = image
                    self?.characterNameDisplayLabel.text = "\(character.name)"
               
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
} //End of class
