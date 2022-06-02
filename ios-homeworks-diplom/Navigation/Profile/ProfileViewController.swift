

import UIKit

class ProfileViewController: UIViewController {

    private lazy var hiddenAvatarImageView: UIImageView = {
       let avatarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
       avatarImageView.image = UIImage(named: "Kyle")
       avatarImageView.translatesAutoresizingMaskIntoConstraints = false
       avatarImageView.contentMode = .scaleAspectFill
       avatarImageView.layer.borderWidth = 3
       avatarImageView.layer.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
       avatarImageView.layer.borderColor = UIColor.white.cgColor
       avatarImageView.layer.cornerRadius = 60
       avatarImageView.clipsToBounds = true
       avatarImageView.alpha = 0
       return avatarImageView
   }()
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.alpha = 0
        return view
    }()
    
    private lazy var exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.backgroundColor = .white
        button.tintColor = .black
        button.setBackgroundImage(UIImage(systemName: "multiply"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapExitButton), for: .touchUpInside)
        button.alpha = 0
        return button
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
    
    private var avatarLeadingConstraint: NSLayoutConstraint?
    private var avatarTopConstraint: NSLayoutConstraint?
    private var avatarHeightConstraint: NSLayoutConstraint?
    private var avatarWidthConstraint: NSLayoutConstraint?
    private var avatarTrailingConstraint: NSLayoutConstraint?
    private var avatarBottomConstraint: NSLayoutConstraint?
    private var isAvatarExpanded: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func avatarTap(_ sender: UITapGestureRecognizer) {
        self.hiddenAvatarImageView.alpha = 1
        self.isAvatarExpanded = true
        self.avatarWidthConstraint?.isActive = self.isAvatarExpanded ? false : true
        self.avatarHeightConstraint?.isActive = self.isAvatarExpanded ? false : true
        self.avatarTrailingConstraint?.isActive = self.isAvatarExpanded ? true : false
        self.avatarBottomConstraint?.isActive = self.isAvatarExpanded ? true : false
        UIView.animate(withDuration: 0.5, animations: {
            self.backView.alpha = 0.5
            self.view.layoutIfNeeded()
        }, completion: {_ in UIView.animate(withDuration: 0.3, animations: {
            self.exitButton.alpha = 1
        })})
    }
    
    @objc func didTapExitButton() {
        self.isAvatarExpanded = false
        self.avatarTrailingConstraint?.isActive = self.isAvatarExpanded ? true : false
        self.avatarBottomConstraint?.isActive = self.isAvatarExpanded ? true : false
        self.avatarWidthConstraint?.isActive = self.isAvatarExpanded ? false : true
        self.avatarHeightConstraint?.isActive = self.isAvatarExpanded ? false : true

        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
            self.backView.alpha = 0
            self.exitButton.alpha = 0
        }, completion: {_ in self.hiddenAvatarImageView.alpha = 0})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .white
        view.backgroundColor = .systemGray6
        view.addSubview(tableView)
        view.addSubview(backView)
        view.addSubview(hiddenAvatarImageView)
        view.addSubview(exitButton)
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
        
        //Add Pic Constraints
        avatarLeadingConstraint = self.hiddenAvatarImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        avatarTrailingConstraint = self.hiddenAvatarImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        avatarBottomConstraint = self.hiddenAvatarImageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        avatarTopConstraint = self.hiddenAvatarImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16)
        avatarWidthConstraint = hiddenAvatarImageView.widthAnchor.constraint(equalToConstant: 120)
        avatarHeightConstraint = hiddenAvatarImageView.heightAnchor.constraint(equalToConstant: 120)
        
        //Add exitButton constraints
        constraints.append(exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16))
        constraints.append(exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16))
        constraints.append(exitButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(exitButton.widthAnchor.constraint(equalToConstant: 50))
        
        //Add backView constraints
        constraints.append(backView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(backView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(backView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        
        //Activate constraints
        NSLayoutConstraint.activate(constraints)
        NSLayoutConstraint.activate([self.avatarTopConstraint, self.avatarLeadingConstraint, self.avatarHeightConstraint, self.avatarWidthConstraint].compactMap({$0}))
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
            cell.likesLabel.isUserInteractionEnabled = true
            cell.likeButtonAction = {
                [unowned self] in
                dataSource[indexPath.row].likes += 1
                cell.addLike()
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         if section == 0 {
            let headerView = ProfileHeaderView()
             headerView.tap.addTarget(self, action: #selector(avatarTap(_:)))
             headerView.avatarImageView.isUserInteractionEnabled = true
             return headerView
         }
        else { return UIView() }
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
        if indexPath.section == 1{
            let detailedPostViewController = DetailedPostViewController()
            let cell = tableView.cellForRow(at: indexPath) as! PostCell
            cell.addViews()
            dataSource[indexPath.row].views += 1
            detailedPostViewController.post = dataSource[indexPath.row]
            navigationController?.present(detailedPostViewController, animated: true)
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
