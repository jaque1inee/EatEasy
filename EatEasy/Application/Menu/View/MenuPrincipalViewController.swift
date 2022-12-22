//
//  MenuPrincipa;ViewController.swift
//  EatEasy
//
//  Created by Jaqueline Oliveira on 24/04/22.
//
import SideMenu
import UIKit

class MenuPrincipalViewController: UIViewController {

    @IBOutlet weak var bannerMenu: UICollectionView!
    @IBOutlet weak var menuPrincipal: UICollectionView!
    @IBOutlet weak var categoriaMenu: UICollectionView!
    
    var menu: SideMenuNavigationController?

    
    var details: [ResultType] = []
    var filteredListBanner: [ResultType] = []
    var filteredList: [ResultType] = []
    var isFiltering: Bool = false
    var presenter: MenuPresenter = MenuPresenter()
    var titlecategoria = ["Todos", "Salad", "Burguer", "Pizza", "Sobremesas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerMenu.dataSource = self
        bannerMenu.delegate = self
        menuPrincipal.dataSource = self
        menuPrincipal.delegate = self
        categoriaMenu.delegate = self
        categoriaMenu.dataSource = self
        presenter.delegate = self
        presenter.getMenuList()
//        menu = SideMenuNavigationController(rootViewController: UIViewController())

    }
    
//    @IBAction func didTappedMenu(_ sender: Any) {
//        present(menu!, animated: true)
//    }
}


extension MenuPrincipalViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannerMenu {
            return self.filteredListBanner.count
     
        } else if collectionView == menuPrincipal {
            if(isFiltering){
                return self.filteredList.count
            } else {
                return self.details.count
            }
        }
        else {
            return self.titlecategoria.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bannerMenu {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellBannerMenu", for: indexPath) as! BannerMenuCollectionViewCell
            let banner = self.details[indexPath.row]
            cell.setup(imageBanner: banner)
            return cell
        }
        if collectionView == menuPrincipal {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellMenuPrincipal", for: indexPath) as! MenuPrincipalCollectionViewCell
            let resultados = self.details[indexPath.row]
            cell.setup(resultado: resultados)
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriaMenu", for: indexPath) as! CategoriaMenuCollectionViewCell
            
            let categoria = self.titlecategoria[indexPath.item]
            cell.titleMenuCategoria.text = categoria
            return cell
        }
   
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriaMenu {
            if (titlecategoria[indexPath.item] != "Todos") {
                presenter.getFilteredList(category: titlecategoria[indexPath.item], foodList: details)
            } else {
                isFiltering = false
                filteredList = []
                self.menuPrincipal.reloadData()
            }
        }
        if collectionView == menuPrincipal {
            performSegue(withIdentifier: "detalhesProdutos", sender: indexPath.item)
            
            collectionView.deselectItem(at: indexPath, animated: true)
         
            
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detalhesProdutos" {
            guard let viewController: DetailsViewController = segue.destination as? DetailsViewController
                else { return }

            viewController.detailsProduto = details[sender as? Int ?? 0]
        }
    }
}

extension MenuPrincipalViewController : MenuPresenterDelegate {
    func didfilteredListBanner(results: [ResultType]) {
        self.filteredListBanner = results
        bannerMenu.reloadData()
    }
    
    func didFilteredFood(results: [ResultType]) {
        isFiltering = true
        self.filteredList = results
        menuPrincipal.reloadData()
    }
    
    func didSuccessMenuPrincipal(results: [ResultType]) {
        self.details = results
        presenter.getfilteredListBanner(bannerList: details)
        menuPrincipal.reloadData()
        
    }
    func didFailureMenuPrincipal(error: String) {
        print("Algum erro aconteceu")
    }
}


