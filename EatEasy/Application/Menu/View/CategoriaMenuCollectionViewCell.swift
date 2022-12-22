//
//  TabMenuCollectionViewCell.swift
//  EatEasy
//
//  Created by Jaqueline Oliveira on 25/04/22.
//

import UIKit

class CategoriaMenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleMenuCategoria: UILabel!
    
    
    func setup(resultado: ResultType){
        titleMenuCategoria.text = resultado.categoria
    }
}
