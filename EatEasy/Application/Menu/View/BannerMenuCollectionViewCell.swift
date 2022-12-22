//
//  BannerMenuCollectionViewCell.swift
//  EatEasy
//
//  Created by Jaqueline Oliveira on 24/04/22.
//

import UIKit

class BannerMenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewBannerMenu: UIView!
    @IBOutlet weak var imageBannerMenu: UIImageView!
    @IBOutlet weak var nameProdutoBannerMenu: UILabel!
    @IBOutlet weak var precoProdutoBannerMenu: UILabel!
    
    
    func setup (imageBanner: ResultType) {
        nameProdutoBannerMenu.text = imageBanner.name
        precoProdutoBannerMenu.text =  "$ \(imageBanner.preco ?? 0)"
        imageBannerMenu.downloaded(from: imageBanner.image ?? "")
        
    }
}
