//
//  MenuPresenter.swift
//  EatEasy
//
//  Created by Jaqueline Oliveira on 25/04/22.
//

import Foundation
import Alamofire


protocol MenuPresenterDelegate: AnyObject{
    func didSuccessMenuPrincipal(results: [ResultType])
    func didFailureMenuPrincipal(error: String)
    func didFilteredFood(results: [ResultType])
    func didfilteredListBanner(results: [ResultType])
}

class MenuPresenter {
    
    weak var delegate : MenuPresenterDelegate?
    
    func getMenuList() {
        AF.request("https://eateasy-d8929-default-rtdb.firebaseio.com/result.json", method: .get).response { [self]
            response in
            switch response.result {
            case .success:
                do {
                    let resultsfinal: [ResultType] = try JSONDecoder() .decode([ResultType].self, from: response.data ?? Data())
                    self.delegate?.didSuccessMenuPrincipal(results: resultsfinal)
                    print("tudo certoo")
                } catch {
                    self.delegate?.didFailureMenuPrincipal(error: "Error")
                }
            case .failure(_):
                self.delegate?.didFailureMenuPrincipal(error: "Error")
                
            }
        }
    }
    
    func getFilteredList(category: String, foodList: [ResultType]) {
        var filteredList: [ResultType] = []
        for food in foodList {
            if(food.categoria == category){
                filteredList.append(food)
            }
        }
        
        delegate?.didFilteredFood(results: filteredList)
    }
    
    func getfilteredListBanner(bannerList: [ResultType]) {
        var filteredListBanner: [ResultType] = []
        for foodBanner in bannerList {
            if(foodBanner.Popular ?? false){
                filteredListBanner.append(foodBanner)
            }
        }
        
        delegate?.didfilteredListBanner(results: filteredListBanner)
        
    }
}
