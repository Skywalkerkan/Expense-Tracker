//
//  ViewController.swift
//  Expense Tracker
//
//  Created by Erkan on 5.05.2023.
//

import UIKit

class ExpensesViewController: UIViewController, UIScrollViewDelegate {

    
    
    
    
    let buttonDeneme: UIButton = {
        let button = UIButton(type: .system)
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "plus.circle.fill")
        imageView.tintColor = .black
        
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(imageView.image?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal), for: .normal)
       
        
        //button.imageView?.contentMode = .scaleAspectFit
        
       // button.setImage(imageView.image?.withTintColor(.red, renderingMode: .alwaysOriginal), for: .normal)
        
       /* let incomeImageView = UIImageView()
        incomeImageView.translatesAutoresizingMaskIntoConstraints = false
        incomeBackImageView.addSubview(incomeImageView)
        incomeImageView.image = UIImage(systemName: "shift.fill")
        incomeImageView.tintColor = .green*/
        
        
        button.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        
        return button
    }()
   
    let tableView = UITableView()
    let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let scrollStackViewContainer: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    
    let backCurrencyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 15
        view.layer.cornerRadius = 15
        return view
    }()
    
    
    let currencyView: UIView = {
        let currencyView = UIView()
        
        currencyView.translatesAutoresizingMaskIntoConstraints = false
          //  view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        currencyView.backgroundColor = .white
        currencyView.layer.cornerRadius = 15
        currencyView.clipsToBounds = true
        

        //Currency Label
        let currencyLabel = UILabel()
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyView.addSubview(currencyLabel)
        currencyLabel.centerXAnchor.constraint(equalTo: currencyView.centerXAnchor, constant: 0).isActive = true
        currencyLabel.topAnchor.constraint(equalTo: currencyView.topAnchor, constant: 15).isActive = true
        currencyLabel.text = "Current Balance"
        currencyLabel.font = UIFont.systemFont(ofSize: 22, weight: .black)
        
        
        //Current Money Label
        let moneyLabel = UILabel()
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyView.addSubview(moneyLabel)
        moneyLabel.text = "15000$"
        moneyLabel.textColor = UIColor.blue
        moneyLabel.font = UIFont.systemFont(ofSize: 30, weight: .black)
        moneyLabel.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 20).isActive = true
        moneyLabel.centerXAnchor.constraint(equalTo: currencyView.centerXAnchor).isActive = true
        
        
        
        let incomeLabel = UILabel()
        currencyView.addSubview(incomeLabel)
        incomeLabel.translatesAutoresizingMaskIntoConstraints = false
        incomeLabel.text = "Income"
        incomeLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        incomeLabel.anchor(top: moneyLabel.bottomAnchor, bottom: nil, leading: currencyView.leadingAnchor, trailing: nil, paddingTop: 15, paddingBottom: 0, paddingLeft: 60, paddingRight: 0, width: 0, height: 0)
        
        
        let incomeMoneyLabel = UILabel()
        currencyView.addSubview(incomeMoneyLabel)
        incomeMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
        incomeMoneyLabel.text = "20000"
        incomeMoneyLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        incomeMoneyLabel.anchor(top: incomeLabel.bottomAnchor, bottom: nil, leading: incomeLabel.leadingAnchor, trailing: nil, paddingTop: 4, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
        
        
        
        let incomeBackImageView = UIView()
        incomeBackImageView.translatesAutoresizingMaskIntoConstraints = false
        currencyView.addSubview(incomeBackImageView)
        incomeBackImageView.backgroundColor = UIColor.init(white: 0.95, alpha: 0.6)
        incomeBackImageView.anchor(top: incomeLabel.bottomAnchor, bottom: nil, leading: nil, trailing: incomeMoneyLabel.leadingAnchor, paddingTop: -8, paddingBottom: 0, paddingLeft: 0, paddingRight: -10, width: 30, height: 30)
        incomeBackImageView.layer.cornerRadius = 15
        
        
        let incomeImageView = UIImageView()
        incomeImageView.translatesAutoresizingMaskIntoConstraints = false
        incomeBackImageView.addSubview(incomeImageView)
        incomeImageView.image = UIImage(systemName: "shift.fill")
        incomeImageView.tintColor = .green
        incomeImageView.centerYAnchor.constraint(equalTo: incomeBackImageView.centerYAnchor).isActive = true
        incomeImageView.centerXAnchor.constraint(equalTo: incomeBackImageView.centerXAnchor).isActive = true
        
        

        
        
        
    
        
        let expenseLabel = UILabel()
        currencyView.addSubview(expenseLabel)
        expenseLabel.translatesAutoresizingMaskIntoConstraints = false
        expenseLabel.text = "Expense"
        expenseLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        expenseLabel.anchor(top: moneyLabel.bottomAnchor, bottom: nil, leading: nil, trailing: currencyView.trailingAnchor, paddingTop: 15, paddingBottom: 0, paddingLeft: 0, paddingRight: -60, width: 0, height: 0)
        
        
        let expenseMoneyLabel = UILabel()
        currencyView.addSubview(expenseMoneyLabel)
        expenseMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
        expenseMoneyLabel.text = "5000"
        expenseMoneyLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        expenseMoneyLabel.anchor(top: expenseLabel.bottomAnchor, bottom: nil, leading: expenseLabel.leadingAnchor, trailing: nil, paddingTop: 4, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
        
        
        let expenseImageBackView = UIView()
        expenseImageBackView.translatesAutoresizingMaskIntoConstraints = false
        currencyView.addSubview(expenseImageBackView)
        expenseImageBackView.backgroundColor = UIColor.init(white: 0.95, alpha: 0.6)
        expenseImageBackView.anchor(top: expenseLabel.bottomAnchor, bottom: nil, leading: nil, trailing: expenseMoneyLabel.leadingAnchor, paddingTop: -8, paddingBottom: 0, paddingLeft: 0, paddingRight: -10, width: 30, height: 30)
        expenseImageBackView.layer.cornerRadius = 15
        
        
        let expenseImageView = UIImageView()
        expenseImageView.translatesAutoresizingMaskIntoConstraints = false
        expenseImageBackView.addSubview(expenseImageView)
        expenseImageView.image = UIImage(systemName: "shift.fill")
        expenseImageView.tintColor = .red
        expenseImageView.centerYAnchor.constraint(equalTo: expenseImageBackView.centerYAnchor).isActive = true
        expenseImageView.centerXAnchor.constraint(equalTo: expenseImageBackView.centerXAnchor).isActive = true
        expenseImageView.transform = CGAffineTransform(scaleX: -1.0, y: -1.0)
        
        

        
        
       // label.font = UIFont(name: "Avenir", size: 25)
        
        
        return currencyView
        
    }()

    
    
    
    
    let trackerDB = TrackerDAO()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        let tableView = UITableView()
        
     //   view.addSubview(labelDeneme)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(addTapped))
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        scrollView.backgroundColor = UIColor(red: 246/255, green: 241/255, blue: 233/255, alpha: 1)
        scrollStackViewContainer.addArrangedSubview(backView)
        backView.backgroundColor = UIColor(red: 246/255, green: 241/255, blue: 233/255, alpha: 1)

        backView.addSubview(backCurrencyView)
        backView.addSubview(buttonDeneme)
        backCurrencyView.addSubview(currencyView)
    
        layoutSubviews()
        
        let height = self.view.frame.height
        print(height)
        print("aaa")
        
        
        buttonDeneme.anchor(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: nil, trailing: currencyView.trailingAnchor, paddingTop: 0, paddingBottom: -10, paddingLeft: 0, paddingRight: -5, width: 45, height: 45)
        

        
        saveAndGetTrackers()
        
        

        


    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       // print(scrollView.contentOffset.y)
      //  let scroll = -scrollView.contentOffset.y
     //   print(scroll)
     //   labelDeneme.topAnchor.constraint(equalTo: currencyView.bottomAnchor,constant: -scrollView.contentOffset.y).isActive = true
      //  labelDeneme.centerXAnchor.constraint(equalTo: currencyView.centerXAnchor).isActive = true
      //  print(scrollView.contentOffset.y)
        
       /* DispatchQueue.main.async {
            print(self.backView.frame)
            print(self.scrollView.frame)
            print(scrollView.contentOffset.y)
            print("a")
            labelDeneme.ancho
        }*/
      
        
        
        
    }

    
    
    
    func saveAndGetTrackers(){
        //let tracker = trackerDB.addNewTracker("Eğlence", accountName: "Erkan", id: 1, money: 1000, )
        let tracker = trackerDB.addNewTracker("Eğlence", accountName: "Erkan", id: 1, totalMoney: 10000, categoryMoney: 1000, trackerNote: "")
        trackerDB.saveTrackers(tracker)
        
        
        let foundTrackers = trackerDB.findTrackersByName("Eğlence")
       // debugPrint(foundTrackers)
        
        
        let newTracker = trackerDB.addNewTracker("Sağlık", accountName: "Erkan", id: 1, totalMoney: 10000, categoryMoney: 2500, trackerNote: "")
        trackerDB.saveTrackers(newTracker)
        
        
      /*  let newTracker = trackerDB.addNewTracker("Mutfak", accountName: "Erkan", id: 2, money: 2000)
        trackerDB.saveTrackers(newTracker)
        
        let newTracker = trackerDB.addNewTracker("AraçGereç", accountName: "Erkan", id: 2, money: 2000)
        trackerDB.saveTrackers(newTracker)
        
        let newTracker = trackerDB.addNewTracker("Sağlık", accountName: "Erkan", id: 2, money: 2000)
        trackerDB.saveTrackers(newTracker)
        
        let newTracker = trackerDB.addNewTracker("Sağlık", accountName: "Erkan", id: 2, money: 2000)
        trackerDB.saveTrackers(newTracker)*/
        
        
        var foundTracker = trackerDB.findTrackersByName("Sağlık")
        debugPrint(foundTracker)
        
        trackerDB.deleteTracker(newTracker)
        
        
    }
    
    
    
 
    override func viewLayoutMarginsDidChange() {
        print(scrollView.bounds.height)
        print(view.frame.height)
        print("a")
        
 
  

    }
    
    
    @objc fileprivate func addTapped(){
        print("Basıldı")
        let controller = GelirGiderViewController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
 
    
    
    
 
    


    
    
    fileprivate func layoutSubviews(){
        
        //ScrollView
        scrollView.anchor(top: view.firstBaselineAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
        
        //StackView
        scrollStackViewContainer.anchor(top: scrollView.firstBaselineAnchor, bottom: scrollView.bottomAnchor, leading: scrollView.leadingAnchor, trailing: scrollView.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        backView.anchor(top: scrollStackViewContainer.firstBaselineAnchor, bottom: scrollStackViewContainer.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 1200)
        
        //CurrencyView
        backCurrencyView.anchor(top: backView.topAnchor, bottom: nil, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, paddingTop: 10, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 175)
        currencyView.anchor(top: backCurrencyView.topAnchor, bottom: backCurrencyView.bottomAnchor, leading: backCurrencyView.leadingAnchor, trailing: backCurrencyView.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
        
        DispatchQueue.main.async {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.currencyView.bounds
            
            let color1 = UIColor(red: 229/255, green: 249/255, blue: 219/255, alpha: 1)
            let color2 = UIColor(red: 160/255, green: 216/255, blue: 179/255, alpha: 1)
            let color3 = UIColor(red: 229/255, green: 249/255, blue: 219/255, alpha: 1)
            
            gradientLayer.colors = [color1.cgColor, color2.cgColor, color3.cgColor]
           //Use diffrent colors
           gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
           gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            self.currencyView.layer.insertSublayer(gradientLayer, at: 0)
        }
        
        
        
    }
    
    

    

}


















