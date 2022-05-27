

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
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosCell")
        return tableView
    }()
    
    private var dataSource: [Post] = []
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .white
        view.backgroundColor = .systemGray6
        view.addSubview(tableView)
        dataSource = fetchData()
        addConstraints()
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
        if section == 0 {return 1} else { return self.dataSource.count }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell", for:indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
            let post = dataSource[indexPath.row]
            cell.setPosts(post: post)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         var headerView = UIView()
         if section == 0 {
             headerView = ProfileHeaderView()
         }
         return headerView
     }
     
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         if section == 0 { return  256 } else { return 0 }
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosViewController = PhotosViewController()
            tableView.deselectRow(at: indexPath, animated: true)
            navigationController?.pushViewController(photosViewController, animated: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}



extension ProfileViewController{
    func fetchData() -> [Post]{
        let post1 = Post(author: "Эрик Картман", description: "Он вульгарен, агрессивен, имеет нездоровые садистские наклонности, нетерпим ко всему чуждому, избалован, груб, враждебен и, ко всему прочему, страдает ожирением.", image: "post1", likes: 25, views: 256)
        let post2 = Post(author: "Стэн Марш", description: "Стэн является резонёром и часто подводит итог или произносит мораль всей серии; для своего возраста он обладает очень глубокими мнениями по многим вопросам. ", image: "post2", likes: 56, views: 382)
        let post3 = Post(author: "Кенни Маккормик", description: "Выходец из чрезвычайно неблагополучной и бедной семьи. ", image: "post3", likes: 39, views: 519)
        let post4 = Post(author: "Баттерс Стотч", description: "Простодушный, легко поддающийся влиянию и закрепощённый, но в то же время ироничный и даже проницательный оптимист. Властные и деспотичные родители часто жестоко наказывают его; в других вопросах ему также всегда не везёт. Баттерс — личность во многом творческая: он поёт, танцует, рисует. Хотя и здесь проявляется его невезение — так, он убил несколько человек на чемпионате по чечётке, когда с его ноги слетел ботинок.", image: "post4", likes: 51, views: 1947)
        return [post1, post2, post3, post4]
    }
}

