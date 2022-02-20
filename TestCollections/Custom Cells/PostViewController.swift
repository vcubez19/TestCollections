//
//  PostViewController.swift
//  TestCollections
//
//  Created by Vincent Cubit on 11/13/21.
//


import UIKit


class PostViewController: UIViewController {

    
    private var sections = [ Section ]()
    
    
    private let table: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(PostImagesCellTableViewCell.self, forCellReuseIdentifier: PostImagesCellTableViewCell.id)
        table.backgroundColor = .systemBackground
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(self.table)
        self.table.delegate = self
        self.table.dataSource = self
        
        
        self.sections = [
            
            Section(title: "Photos", cells: [
                PostCell(images: UIImage(named: "basil-plant.png")!),
                PostCell(images: UIImage(named: "basil-plant.png")!),
                PostCell(images: UIImage(named: "basil-plant.png")!),
                PostCell(images: UIImage(named: "basil-plant.png")!),
            ])
            
        ]
        

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.table.frame = self.view.bounds
    }
    

}


extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].cells.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].title
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: PostImagesCellTableViewCell.id,
                                                      for: indexPath) as? PostImagesCellTableViewCell else { return UITableViewCell() }
        cell.configure(with: self.sections[indexPath.section].cells[indexPath.row])
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
}

