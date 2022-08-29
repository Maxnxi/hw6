import UIKit

class ListViewController: UIViewController {
    
    var output: ListViewOutput?
    var router: ListRouterInput?
    
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    var tableContents: [ListViewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.backgroundColor = .white
        //        title = "Artists"
        configureUI()
        output?.viewIsReady()
    }
}

extension ListViewController: ListViewInput {
    func reload(_ viewModels: [ListViewModel]) {
        title = "Artists"
        tableContents = viewModels
        tableView.reloadData()
    }
}
    
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContents?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = tableContents?[indexPath.row].artist.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let id = tableContents?[indexPath.row].artist.identifier ?? 0
        let viewController = DetailAssembly.assemble(artistId: id)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

private extension ListViewController {
    
    enum Configuration {
        static let cellIdentifier = "cell"
    }
    
    func configureUI() {
        view.addSubview(tableView)
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: ListViewDataHandler.artistCellIdentifier
        )
        tableView.dataSource = self
        tableView.delegate = self
        constrainTableView()
    }
}

private extension ListViewController {
    
    func constrainTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
