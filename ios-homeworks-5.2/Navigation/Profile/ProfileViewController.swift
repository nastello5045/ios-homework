

import UIKit

class ProfileViewController: UIViewController {

   private let profileHeader: ProfileHeaderView = {
       let profileHeader = ProfileHeaderView()
       profileHeader.translatesAutoresizingMaskIntoConstraints = false
       return profileHeader
   }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
        return tableView
    }()
    
    private var dataSource: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(tableView)
        dataSource = fetchData()
        addConstraints()
        self.setupHideKeyboardOnTap()
    }
    
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }

    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
    
    private func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        //Add tableView constraints
        constraints.append(tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        
        //Activate constraints
        NSLayoutConstraint.activate(constraints)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.dataSource.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        let post = dataSource[indexPath.row]
        cell.setPosts(post: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         var headerView = UIView()
         if section == 0 {
             headerView = ProfileHeaderView()
         }
         return headerView
     }
     
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return  256
     }
    
}


extension ProfileViewController{
    func fetchData() -> [Post]{
        let post1 = Post(author: "Cat", description: "Look at this", image: "post1", likes: 25, views: 256)
        let post2 = Post(author: "Cool Cat", description: "Look!!!", image: "post2", likes: 37, views: 128)
        let post3 = Post(author: "Cooler Cat", description: "this!", image: "post3", likes: 75, views: 516)
        let post4 = Post(author: "More Cooler Cat", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: "post4", likes: 95, views: 1024)
        return [post1, post2, post3, post4]
    }
}
