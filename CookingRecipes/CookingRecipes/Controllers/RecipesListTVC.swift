//
//  RecipesListTVC.swift
//  CookingRecipes
//
//  Created by Hiram Castro on 10/31/20.
//

import UIKit

class RecipesListTVC: UITableViewController {

    @IBOutlet weak var SearchBar: UISearchBar!
    
    private let mealListVM = MealListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 112
        
        SearchBar.delegate = self
        
        searchMeal()
    }
    
    private func searchMeal(_ searchText:String = "") {
        mealListVM.searchForMeals(searchText) { [weak self] (result) in
            guard let self = self else { return }
            if result {
                DispatchQueue.main.async { self.tableView.reloadData() }
            } else {
                self.showAlert()
            }
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "", message: mealListVM.errorMessage, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mealListVM.mealVM.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeCell
        else { return UITableViewCell() }
        
        cell.mealVM = mealListVM.getMealVM(at: indexPath.row)

        return cell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RecipesListTVC:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchMeal(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchMeal(searchBar.text ?? "")
    }
}
