//
//  MenuPrincipalCollectionViewCell.swift
//  EatEasy
//
//  Created by Jaqueline Oliveira on 24/04/22.
//

import UIKit

class MenuPrincipalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewMenuPrincipal: UIView!
    @IBOutlet weak var imageMenuPrincipal: UIImageView!
    @IBOutlet weak var nomeProdutoMenu: UILabel!
    @IBOutlet weak var precoProdutoMenu: UILabel!
    
    func setup(resultado: ResultType) {
        precoProdutoMenu.text = "$ \(resultado.preco ?? 0)"
        nomeProdutoMenu.text = resultado.name
        imageMenuPrincipal.downloaded(from: resultado.image ?? "")
        
        viewMenuPrincipal.layer.cornerRadius = 10
        viewMenuPrincipal.layer.shadowColor = UIColor.lightGray.cgColor
        viewMenuPrincipal.layer.shadowOffset = CGSize(width: 1, height: 1)
        viewMenuPrincipal.layer.shadowRadius = 4
        viewMenuPrincipal.layer.shadowOpacity = 0.1

    }
}
