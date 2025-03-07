//
//  ListVC.swift
//  PokemonShow
//
//  Created by MacBook on 3/7/25.
//

import UIKit
import Kingfisher

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    private let viewModel = PokemonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        registerCellAndTableView()
        bindViewModel()
        viewModel.fetchPokemon(limit: 20, offset: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lblName.text = UtilitiesManager.shared.UserName
    }
    
    
    func registerCellAndTableView() {
        tblView.delegate = self
        tblView.dataSource = self
        
        let nib = UINib(nibName: "listTableViewCell", bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: "listTableViewCell")
    }
    
    func setupUI() {
        lblName.text = UtilitiesManager.shared.UserName
    }
    
    func bindViewModel() {
        viewModel.onDataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tblView.reloadData()
            }
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTableViewCell") as! listTableViewCell
        let pokemon = viewModel.pokemons[indexPath.row]
        let imageUrl = viewModel.imageURL(for: indexPath.row)
        
        cell.configure(with: pokemon, imageUrl: imageUrl)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
