//
//  GelirGiderViewController.swift
//  Expense Tracker
//
//  Created by Erkan on 7.05.2023.
//

import UIKit

class GelirGiderViewController: UIViewController {

    var tiklandi = ""
    
    let gelirButton: UIButton = {
        let button = UIButton()
        button.setTitle("Gelir", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.green.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(gelirTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func gelirTapped(){
        gelirButton.setTitleColor(.green, for: .normal)
        gelirButton.layer.borderColor = UIColor.green.cgColor
        giderButton.setTitleColor(.black, for: .normal)
        giderButton.layer.borderColor = UIColor.black.cgColor
        havaleButton.setTitleColor(.black, for: .normal)
        havaleButton.layer.borderColor = UIColor.black.cgColor
        tiklandi = TrackerEnum.Gelir.rawValue
    }
    
    
    let giderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Gider", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(giderTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func giderTapped(){
        gelirButton.setTitleColor(.black, for: .normal)
        gelirButton.layer.borderColor = UIColor.black.cgColor
        giderButton.setTitleColor(.red, for: .normal)
        giderButton.layer.borderColor = UIColor.red.cgColor
        havaleButton.setTitleColor(.black, for: .normal)
        havaleButton.layer.borderColor = UIColor.black.cgColor
        tiklandi = TrackerEnum.Gider.rawValue
    }
    
    
    let havaleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Havale", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(havaleTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func havaleTapped(){
        gelirButton.setTitleColor(.black, for: .normal)
        gelirButton.layer.borderColor = UIColor.black.cgColor
        giderButton.setTitleColor(.black, for: .normal)
        giderButton.layer.borderColor = UIColor.black.cgColor
        havaleButton.setTitleColor(.purple, for: .normal)
        havaleButton.layer.borderColor = UIColor.purple.cgColor
        tiklandi = TrackerEnum.Havale.rawValue
    }
    
    //Enüst Buraya kadar
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        barButtons()
        layoutConstraints()
        
        
        
        
        
       
        
        
        
       
    }
    
    
    
    fileprivate func barButtons(){
        let backItem = UIBarButtonItem()
        backItem.title = "Geri"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backItem
    }
    
    
    fileprivate func layoutConstraints(){
        view.addSubview(gelirButton)
        gelirButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: nil, paddingTop: 5, paddingBottom: 0, paddingLeft: 20, paddingRight: 0, width: view.frame.width/3 - 27, height: 30)

        
        
         view.addSubview(giderButton)
        giderButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: gelirButton.trailingAnchor, trailing: nil, paddingTop: 5, paddingBottom: 0, paddingLeft: 20, paddingRight: 0, width: view.frame.width/3 - 27, height: 30)
        
        
        view.addSubview(havaleButton)
        havaleButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: giderButton.trailingAnchor, trailing: nil, paddingTop: 5, paddingBottom: 0, paddingLeft: 20, paddingRight: 0, width: view.frame.width/3 - 27, height: 30)
        
        
        
        
        
    }
    

    

}
