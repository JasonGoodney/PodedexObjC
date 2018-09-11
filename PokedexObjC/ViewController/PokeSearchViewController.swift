//
//  PokeSearchViewController.swift
//  PokedexObjC
//
//  Created by Jason Goodney on 9/11/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class PokeSearchViewController: UIViewController {

    @IBOutlet weak var pokeSearchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    var pokemon: JTGPokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pokeSearchBar.delegate = self
        
        search(for: "Mew")
    }
    
    func updateView() {
        guard let pokemon = self.pokemon else { return }
        nameLabel.text = pokemon.name.capitalized
        idLabel.text = "\(pokemon.identifier)"
        
        let abilities = pokemon.abilities.map { $0.capitalized }.joined(separator: "\n")
        abilitiesLabel.text = abilities
    }
    
    func search(for searchTerm: String) {
        JTGPokemonController.fetchPokemon(forSearchTerm: searchTerm) { (pokemon) in
            self.pokemon = pokemon
            DispatchQueue.main.async {
                self.updateView()
            }
            
        }
    }

}

extension PokeSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let pokemon = searchBar.text else { return }
        search(for: pokemon)
    }
}









