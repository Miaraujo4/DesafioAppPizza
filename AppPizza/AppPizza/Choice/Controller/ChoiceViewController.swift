//
//  ChoiceViewController.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 03/06/21.
//

import UIKit

class ChoiceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var pizzaTableView: UITableView!
    
    // MARK: - Properties
    private let viewModel: ChoiceViewModel = ChoiceViewModel()
    private let segueIdentifier: String = "detailSegue"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        searchTextField.delegate = self
        super.viewDidLoad()
        registerCell()
        setIcon()
        viewModel.getPizzas { didGetPizzas in
            DispatchQueue.main.async {
                if didGetPizzas {
                    self.pizzaTableView.reloadData()
                } else {
                    print("No Data")
                }
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        viewModel.filterPizza(namePizza: searchTextField.text) {
            pizzaTableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            if let detailViewController: DetailViewController = segue.destination as? DetailViewController {
                detailViewController.viewModelDetail.pizza = sender as? PizzaInfo
                detailViewController.modalPresentationStyle = .fullScreen
            }
        }
    }
    
    //MARK: - Private Function
    private func setIcon() {
        let searchImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 15.63, height: 15.78))
        
        searchImage.image = #imageLiteral(resourceName: "searchIcon")
        searchImage.contentMode = .scaleAspectFit
        searchImage.tintColor = #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 1)
        searchTextField.leftView = searchImage
        searchTextField.leftViewMode = .always
    }
    
    private func registerCell() {
        let pizzaCellNib: UINib = UINib(nibName: "PizzaTableViewCell", bundle: nil)
        pizzaTableView.register(pizzaCellNib, forCellReuseIdentifier: PizzaTableViewCell.cellIdentifier)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listPizza.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: PizzaTableViewCell = tableView.dequeueReusableCell(withIdentifier: PizzaTableViewCell.cellIdentifier, for: indexPath) as? PizzaTableViewCell {
            cell.cellPizzaView.layer.cornerRadius = 10
            cell.imagePizzas.layer.cornerRadius = 10
            cell.imagePizzas.load(urlString: viewModel.listPizza[indexPath.row].imageUrl)
            cell.imagePizzas.contentMode = .scaleAspectFit
            cell.pizzaNameLabel.text = "Pizza de " + viewModel.listPizza[indexPath.row].name
            cell.descriptionLabel.text = "a partir de:"
            cell.priceLabel.text = "R$ " + String(format: "%.2f", viewModel.listPizza[indexPath.row].priceP).replacingOccurrences(of: ".", with: ",")
            let imageStars = [cell.star1Image, cell.star2Image, cell.star3Image, cell.star4Image, cell.star5Image]
            imageStars.forEach { img in
                img?.image = #imageLiteral(resourceName: "starGrey")
            }
            let rating: Int = viewModel.listPizza[indexPath.row].rating
            
            for position in 0...rating - 1 {
                imageStars[position]?.image = #imageLiteral(resourceName: "starYellow")
            }
        return cell
    } else {
    return UITableViewCell()
    }
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 106.0
}
}

extension ChoiceViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        viewModel.filterPizza(namePizza: searchTextField.text) {
            pizzaTableView.reloadData()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let nameOfPizza = textField.text
        
        viewModel.filterPizza(namePizza: nameOfPizza) {
            pizzaTableView.reloadData()
        }
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pizzaSelect = viewModel.listPizza[indexPath.row]
        performSegue(withIdentifier: segueIdentifier, sender: pizzaSelect)
    }
}


