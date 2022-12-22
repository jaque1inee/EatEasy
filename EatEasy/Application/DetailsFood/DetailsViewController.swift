//
//  DetalhesViewController.swift
//  EatEasy
//
//  Created by Jaqueline Oliveira on 30/04/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var detailsProduto: ResultType?

    @IBOutlet weak var imageDetalhesProduto: UIImageView!
    @IBOutlet weak var viewDetalhesProduto: UIView!
    
    @IBOutlet weak var precoDetalhesProduto: UILabel!
    @IBOutlet weak var descricaoDetalhesProduto: UILabel!
    @IBOutlet weak var nomeProdutoDetalhes: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageDetalhesProduto.downloaded(from: detailsProduto?.image ?? "")
        precoDetalhesProduto.text = "$\(detailsProduto?.preco ?? 0)"
        nomeProdutoDetalhes.text = detailsProduto?.name
        descricaoDetalhesProduto.text = detailsProduto?.descricao
    }
    

    @IBAction func didPressedBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
