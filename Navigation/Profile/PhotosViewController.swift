

import UIKit

class PhotosViewController: UIViewController {

    private lazy var layout: UICollectionViewFlowLayout = {
            $0.scrollDirection = .vertical
            $0.minimumLineSpacing = 8
            $0.minimumInteritemSpacing = 8
            return $0
        }(UICollectionViewFlowLayout())
        
        private lazy var collectionView: UICollectionView = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .white
            $0.dataSource = self
            $0.delegate = self
            $0.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
            return $0
        }(UICollectionView(frame: .zero, collectionViewLayout: self.layout))
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(false, animated: animated)
        }
        
    override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = .systemGray6
            self.title = "Фото Галерея"
            self.navigationController?.navigationBar.isHidden = false
            setupLayout()
        }
        
        private func setupLayout() {
            view.addSubview(collectionView)
            
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
}
